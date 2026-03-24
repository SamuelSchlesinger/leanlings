/- # IO 2: IO Actions

  IO actions can be combined:

    def askAge : IO Nat := do
      IO.println "How old are you?"
      let input ← IO.getLine  -- not available standalone, skip
      return 0

  IO.println, IO.print, and IO.eprintln are common actions.
  You can use `let` and `←` in IO do blocks just like Option.

  TODO: Implement printCountdown.
-/

-- Print numbers from n down to 1, each on its own line
-- Use a for loop with List.range
def printCountdown (n : Nat) : IO Unit := sorry

def main : IO Unit := do
  printCountdown 5
