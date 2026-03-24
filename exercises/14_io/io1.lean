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

  TODO: Implement the greeting function and main.
-/

-- Print a personalized greeting
def greet (name : String) : IO Unit := sorry

def main : IO Unit := do
  sorry
