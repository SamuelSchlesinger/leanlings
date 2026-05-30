def printCountdown (n : Nat) : IO Unit := do
  for i in List.range n do
    IO.println s!"{n - i}"

def main : IO Unit := do
  printCountdown 5
