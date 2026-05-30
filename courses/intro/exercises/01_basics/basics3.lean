/- # Basics 3: String Operations

  Strings in Lean can be concatenated with `++`:
    "Hello, " ++ "world!" = "Hello, world!"

  You can also use string interpolation with `s!"..."`:
    let name := "Lean"
    s!"Hello, {name}!" = "Hello, Lean!"

  TODO: Replace each `sorry` with a string expression.
-/

-- Use `++` to concatenate two strings
def hello : String := sorry

-- Use `s!"..."` with `{name}` to interpolate a variable
def name := "Lean"
def greeting : String := sorry

-- Don't change below this line!
#guard hello == "Hello, Lean!"
#guard greeting == "Hello, Lean!"
