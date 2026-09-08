#!/usr/bin/env python3
"""Exercise the native learner workflow in a disposable copy of the curriculum.

Default: first two tasks and a completion fixture in each course, plus guides,
failed rechecks, IO feedback, and saving edits in watch mode. --all instead walks
every exercise in order, rejecting its template and submitting its reference.
This is a reference replay and interaction test, not an independent solution of
all tasks or an empirical measure of learning. Requires lake build first.
"""
import argparse
import json
import os
from pathlib import Path
import pty
import re
import select
import shutil
import subprocess
import tempfile
import time

ROOT = Path(__file__).resolve().parents[1]
BINARY = ROOT / '.lake/build/bin/leanlings'
ANSI = re.compile(r'\x1b\[[0-9;]*[A-Za-z]')
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--all', action='store_true', help='Replay every task in course order')
args = parser.parse_args()
export = subprocess.run(['lake', 'env', 'lean', '--run', 'scripts/Export.lean'],
                        cwd=ROOT, text=True, capture_output=True, check=True, timeout=60)
manifest = json.loads(export.stdout)

with tempfile.TemporaryDirectory(prefix='leanlings-workflow-') as directory:
    workspace = Path(directory)
    for name in ['lakefile.lean', 'lake-manifest.json', 'lean-toolchain']:
        shutil.copy2(ROOT / name, workspace / name)
    (workspace / '.lake').symlink_to(ROOT / '.lake', target_is_directory=True)
    shutil.copytree(ROOT / 'courses', workspace / 'courses')
    state_path = workspace / '.leanlings-state'

    def cli(*command, expected=0):
        result = subprocess.run([str(BINARY), *command], cwd=workspace,
                                text=True, capture_output=True, timeout=60)
        output = ANSI.sub('', result.stdout + result.stderr)
        assert result.returncode == expected, (command, result.returncode, output)
        return output

    def state():
        lines = state_path.read_text().splitlines()
        return lines[0], lines[1], set(lines[3:])

    def exercise_path(course, exercise):
        return workspace / 'courses' / course['id'] / 'exercises' / (exercise['id'] + '.lean')

    def submit(course, exercise, source):
        exercise_path(course, exercise).write_text(source)
        return cli('run')

    assert 'intro1.lean' in cli()
    completed_courses = set()
    checked = 0
    for course in manifest['courses']:
        cid = course['id']
        exercises = course['exercises']
        first = exercises[0]
        switched = cli('course', cid)
        assert course['welcome'].strip() in switched
        assert f'courses/{cid}/guide.md' in switched
        assert state() == (cid, first['id'], completed_courses)
        before = state_path.read_bytes()
        assert course['guide'].strip() in cli('guide')
        assert state_path.read_bytes() == before
        listing = cli('list')
        for unit in course['units']:
            entry = next(e for e in exercises if e['unit'] == unit['id'])
            notes = cli('guide', entry['id'])
            assert unit['id'] in listing
            if unit['guide']:
                assert unit['guide'].strip() in notes
            else:
                assert 'opening comments' in notes
            assert state_path.read_bytes() == before
        cli('guide', 'missing/exercise', expected=1)
        assert state_path.read_bytes() == before
        if cid == 'analysis':
            ambiguous = cli('guide', 'add_comm', expected=1)
            assert 'Rat/add_comm' in ambiguous and 'Real/add_comm' in ambiguous
            assert state_path.read_bytes() == before

        chosen = exercises if args.all else exercises[:2]
        for index, exercise in enumerate(chosen):
            assert state()[1] == exercise['id']
            before = state_path.read_bytes()
            assert exercise['hint'] in cli('hint')
            assert exercise['solution'].strip() in cli('solution')
            assert state_path.read_bytes() == before
            cli('run', expected=1)
            assert cid + '/' + exercise['id'] not in state()[2]
            accepted = submit(course, exercise, exercise['solution'])
            checked += 1
            expected_done = completed_courses | {cid + '/' + e['id'] for e in exercises[:index + 1]}
            assert state()[2] == expected_done
            assert f'{index + 1}/{len(exercises)}' in accepted
            if index + 1 < len(exercises):
                moved = cli('next')
                assert state()[1] == exercises[index + 1]['id']
                assert 'guide' in moved
            if index + 1 == len(chosen) or exercises[index + 1]['unit'] != exercise['unit']:
                print(f'{cid}/{exercise["unit"]}: checked through {exercise["id"]}', flush=True)

        if not args.all:
            # A fixture isolates the last-task transition without compiling all
            # intermediate references in the default smoke test.
            previous = completed_courses | {cid + '/' + e['id'] for e in exercises[:-1]}
            state_path.write_text('\n'.join([cid, exercises[-1]['id'], '---', *sorted(previous)]) + '\n')
            cli('run', expected=1)
            accepted = submit(course, exercises[-1], exercises[-1]['solution'])
            checked += 1
        assert course['conclusion'].strip() in accepted
        assert 'leanlings next' not in accepted
        completed_courses |= {cid + '/' + e['id'] for e in exercises}
        assert state()[2] == completed_courses
        assert course['conclusion'].strip() in cli()

        # A saved regression must revoke its previous completion, preserving
        # all other exercises and courses. Reading a guide must not repair it.
        exercise_path(course, first).write_text(first['source'])
        cli('run', first['id'], expected=1)
        assert state()[2] == completed_courses - {cid + '/' + first['id']}
        cli('guide', first['id'])
        assert state()[2] == completed_courses - {cid + '/' + first['id']}
        exercise_path(course, first).write_text(first['solution'])
        assert course['conclusion'].strip() in cli('run', first['id'])
        print(f'{cid}: course completion and failed recheck passed', flush=True)

    # A plausible wrong answer must explain the failed requirement.
    intro = manifest['courses'][0]
    first, second = intro['exercises'][:2]
    cli('course', 'intro')
    exercise_path(intro, first).write_text('def greeting : String := "Hello, Lean"\n')
    failed = cli('run', first['id'], expected=1)
    assert "doesn't satisfy" in failed and 'error:' in failed
    assert 'courses/intro/tests/00_intro/intro1.lean' in failed
    exercise_path(intro, first).write_text(first['solution'])
    cli('run', first['id'])
    io_exercise = next(e for e in intro['exercises'] if e['id'] == '15_io/io1')
    exercise_path(intro, io_exercise).write_text('def main : IO Unit := IO.println "wrong"\n')
    failed = cli('run', io_exercise['id'], expected=1)
    assert 'prints the wrong output' in failed and 'Expected:' in failed and 'Actual:' in failed

    # Follow the taught technique in the editable template, independently of
    # whatever proof the reference answer happens to use.
    nng = next(c for c in manifest['courses'] if c['id'] == 'nng')
    macro_task = next(e for e in nng['exercises'] if e['id'] == 'Algorithm/add_algo3')
    cli('course', 'nng')
    exercise_path(nng, macro_task).write_text(macro_task['source'].replace('  sorry', '  simp_add'))
    cli('run', macro_task['id'])

    # Real save/recheck/advance behavior, using a terminal as learners do.
    state_path.write_text('intro\n00_intro/intro1\n---\n')
    exercise_path(intro, first).write_text(first['source'])
    exercise_path(intro, second).write_text(second['source'])
    third = intro['exercises'][2]
    exercise_path(intro, third).write_text(third['source'])
    master, slave = pty.openpty()
    watcher = subprocess.Popen([str(BINARY), 'watch'], cwd=workspace,
                               stdin=subprocess.DEVNULL, stdout=slave, stderr=slave)
    os.close(slave)
    output = ''

    def wait_for(needle):
        global output
        deadline = time.monotonic() + 30
        while needle not in output and time.monotonic() < deadline:
            if select.select([master], [], [], 0.1)[0]:
                output += ANSI.sub('', os.read(master, 65536).decode(errors='replace'))
        assert needle in output, (needle, output)

    try:
        wait_for('still has')
        assert 'courses/intro/guide.md' in output
        exercise_path(intro, first).write_text(first['solution'])
        wait_for('intro2.lean')
        assert state() == ('intro', second['id'], {'intro/' + first['id']})
        exercise_path(intro, second).write_text(second['solution'])
        wait_for('intro3.lean')
        assert state() == ('intro', third['id'], {'intro/' + first['id'], 'intro/' + second['id']})
    finally:
        watcher.terminate()
        try:
            watcher.wait(timeout=5)
        except subprocess.TimeoutExpired:
            watcher.kill()
            watcher.wait(timeout=5)
        os.close(master)
    print(f'Passed {checked} task submissions, every unit guide, course transitions, feedback, and watch-mode saves.')
