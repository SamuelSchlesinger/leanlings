/- # IO 1: Input and Output

  `IO` is a monad for side effects. The `main` function
  has type `IO Unit`:

    def main : IO Unit := do
      IO.println "Hello, World!"

  You can sequence IO actions with `do`:

    def main : IO Unit := do
      let name := "Lean"
      IO.println s!"Hello, {name}!"
      IO.println "Goodbye!"

  TODO: 1. Implement `greet` to print "Hello, {name}!"
           using `IO.println` and string interpolation `s!"..."`.
        2. Have `main` call `greet` with a name.
-/

-- Print "Hello, {name}!" using IO.println and s!"..."
def greet (name : String) : IO Unit := sorry

def main : IO Unit := do
  sorry
