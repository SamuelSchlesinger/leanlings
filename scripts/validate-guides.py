#!/usr/bin/env python3
"""Compile each complete Lean example in the course and unit guides.

Each lean fence is a standalone file with its own imports. Partial outlines
must use a text fence instead; complete examples must not use sorry.
"""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
examples = [(path, index + 1, code)
            for path in sorted((ROOT / 'courses').rglob('*.md'))
            for index, code in enumerate(re.findall(r'^```lean\n(.*?)^```\s*$',
                                                     path.read_text(), re.M | re.S))]


def validate(entry):
    path, index, source = entry
    with tempfile.TemporaryDirectory(prefix='leanlings-guide-') as tmp:
        example = Path(tmp) / 'Example.lean'
        example.write_text(source)
        result = subprocess.run(['lake', 'env', 'lean', str(example)], cwd=ROOT,
                                capture_output=True, text=True, timeout=60)
        output = result.stdout + result.stderr
        if result.returncode or 'declaration uses `sorry`' in output:
            return f'{path.relative_to(ROOT)} example {index}:\n{output}'
    return None


with ThreadPoolExecutor(max_workers=4) as pool:
    failures = [failure for failure in pool.map(validate, examples) if failure]
if failures:
    raise SystemExit('\n'.join(failures))
print(f'Compiled all {len(examples)} guide examples without unfinished proofs.')
