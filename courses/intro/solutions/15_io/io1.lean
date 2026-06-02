def greet (name : String) : IO Unit :=
  IO.println s!"Hello, {name}!"

def main : IO Unit := do
  greet "Lean"
  greet "World"
