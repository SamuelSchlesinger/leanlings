"""Contracts preserve public theorem types without freezing implementations."""
import json
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
reference = '''universe u
namespace ContractFixture
def count : List Nat → Nat
  | [] => 0
  | _ :: xs => count xs + 1
theorem count_length (xs : List Nat) : count xs = xs.length := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [count, ih]
private theorem helper : True := True.intro
theorem identity {α : Sort u} (x : α) : x = x := rfl
end ContractFixture
'''
alternative = '''universe u
namespace ContractFixture
def count : List Nat → Nat := List.length
theorem count_length (xs : List Nat) : count xs = xs.length := rfl
theorem identity {α : Sort u} (x : α) : x = x := by rfl
end ContractFixture
'''

with tempfile.TemporaryDirectory(prefix='leanlings-contract-test-') as tmp:
    path = Path(tmp) / 'Reference.lean'
    path.write_text('import Leanlings.Contracts\n' + reference + '\n#emit_leanlings_contracts\n')
    result = subprocess.run(['lake', 'env', 'lean', str(path)], cwd=ROOT,
                            capture_output=True, text=True, timeout=60)
    assert result.returncode == 0, result.stdout + result.stderr
    records = [json.loads(line.removeprefix('LEANLINGS_CONTRACTS '))
               for line in result.stdout.splitlines() if line.startswith('LEANLINGS_CONTRACTS ')]
    assert len(records) == 1, result.stdout
    contracts = records[0]
    assert {c['name'] for c in contracts} == {
        'ContractFixture.count_length', 'ContractFixture.identity'}, contracts
    suffix = '\n'.join(c['check'] for c in contracts)
    path.write_text(alternative + suffix)
    result = subprocess.run(['lake', 'env', 'lean', str(path)], cwd=ROOT,
                            capture_output=True, text=True, timeout=60)
    assert result.returncode == 0, result.stdout + result.stderr
    path.write_text(alternative.replace(
        'theorem count_length (xs : List Nat) : count xs = xs.length := rfl',
        'theorem count_length : True := True.intro') + suffix)
    result = subprocess.run(['lake', 'env', 'lean', str(path)], cwd=ROOT,
                            capture_output=True, text=True, timeout=60)
    assert result.returncode != 0, 'Changed theorem statement accepted'

print('Contract generation accepts alternative implementations and rejects changed statements.')
