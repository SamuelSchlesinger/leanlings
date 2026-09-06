#!/usr/bin/env python3
"""Check reference answers, unfinished templates, and empty submissions.

Uses the same behavioral and theorem checks as the CLI and exported curriculum.
Does not edit exercises or a learner's progress. Compile trusted local material
only; subprocess time limits are test limits, not an untrusted-code sandbox.
"""
import argparse
from concurrent.futures import ThreadPoolExecutor
import json
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--course', choices=['intro', 'nng', 'algebra', 'analysis'])
args = parser.parse_args()
export = subprocess.run(['lake', 'env', 'lean', '--run', 'scripts/Export.lean'],
                        cwd=ROOT, text=True, capture_output=True, timeout=60)
if export.returncode:
    raise SystemExit(f'Course export failed:\n{export.stdout}{export.stderr}')
manifest = json.loads(export.stdout)
assert manifest['schemaVersion'] == 1
exercises = [(course['id'], exercise) for course in manifest['courses']
             if not args.course or course['id'] == args.course for exercise in course['exercises']]
listed = [(course, exercise['id']) for course, exercise in exercises]
if len(set(listed)) != len(listed):
    raise SystemExit('Duplicate course/exercise identifiers in the catalog.')
physical = {(course['id'], p.relative_to(ROOT / 'courses' / course['id'] / 'exercises').with_suffix('').as_posix())
            for course in manifest['courses'] if not args.course or course['id'] == args.course
            for p in (ROOT / 'courses' / course['id'] / 'exercises').rglob('*.lean')}
if set(listed) != physical:
    raise SystemExit(f'Catalog and exercise files disagree: {set(listed) ^ physical}')


def incomplete(stdout):
    return ('declaration uses `sorry`' in stdout or
            any('depends on axioms:' in line and 'sorryAx' in line for line in stdout.splitlines()))


def validate(entry):
    course, exercise = entry
    label = f'{course}/{exercise["id"]}'
    suffix = '\n\n' + exercise['checks'] + '\n\n' + exercise['contracts']
    expected = exercise['expectedOutput']
    with tempfile.TemporaryDirectory(prefix='leanlings-validate-') as tmp:
        def check(source):
            path = Path(tmp) / 'Check.lean'
            path.write_text(source + suffix)
            result = subprocess.run(['lake', 'env', 'lean', str(path)], cwd=ROOT,
                                    capture_output=True, text=True, timeout=60)
            passed = result.returncode == 0 and not incomplete(result.stdout + result.stderr)
            if passed and expected is not None:
                result = subprocess.run(['lake', 'env', 'lean', '--run', str(path)], cwd=ROOT,
                                        capture_output=True, text=True, timeout=60)
                passed = result.returncode == 0 and result.stdout.replace('\r\n', '\n') == expected
            return passed, result.stdout + result.stderr

        passed, output = check(exercise['solution'])
        if not passed:
            raise RuntimeError(f'Reference rejected: {label}\n{output}')
        for kind, source in [('unfinished', exercise['source']), ('empty', '')]:
            passed, output = check(source)
            if passed:
                raise RuntimeError(f'{kind.title()} submission accepted: {label}\n{output}')
    return label


with ThreadPoolExecutor(max_workers=4) as pool:
    checked = list(pool.map(validate, exercises))
print(f'Passed {len(checked)} reference answers, including IO output contracts; rejected every unfinished and empty submission.')
