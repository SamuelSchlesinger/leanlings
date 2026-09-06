/- # Basics 3: String Operations

  Strings in Lean can be concatenated with `++`:
    "Hello, " ++ "world!" = "Hello, world!"

  You can also use string interpolation with `s!"..."`:
    let name := "Lean"
    s!"Hello, {name}!" = "Hello, Lean!"

  TODO: Make both `hello` and `greeting` equal "Hello, Lean!".
  Use concatenation for `hello` and interpolation for `greeting`.
  Include the comma, space, and exclamation mark in both results.
-/

-- Use `++` to concatenate two strings
def hello : String := sorry

-- Use `s!"..."` with `{name}` to interpolate a variable
def name := "Lean"
def greeting : String := sorry
