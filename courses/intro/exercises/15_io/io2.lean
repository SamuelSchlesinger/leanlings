/- # IO 2: IO Actions

  IO actions can be combined in `do` blocks:

    def greetTwice (name : String) : IO Unit := do
      IO.println s!"Hello, {name}!"
      IO.println s!"Nice to meet you, {name}!"

  Common IO actions:
  • `IO.println` — print a line
  • `IO.print` — print without a newline
  • `for i in List.range n do` — loop n times

  You can use `let` and `←` in IO `do` blocks just like
  you did with `Option` in the previous module.

  TODO: Implement printCountdown.
-/

-- Print numbers from n down to 1, each on its own line
-- Use a for loop with List.range
def printCountdown (n : Nat) : IO Unit := sorry

def main : IO Unit := do
  printCountdown 5
