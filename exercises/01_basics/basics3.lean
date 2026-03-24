/- # Basics 3: String Operations

  Strings in Lean can be concatenated with `++`:
    "Hello, " ++ "world!" = "Hello, world!"

  You can also use string interpolation with `s!"..."`:
    let name := "Lean"
    s!"Hello, {name}!" = "Hello, Lean!"

  TODO: Replace `sorry` with an expression that produces
        the string "Hello, Lean!" using string concatenation.
-/

def hello : String := sorry
