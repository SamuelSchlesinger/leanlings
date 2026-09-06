/- # Intro 1: Hello, Lean!

  Your first task is to give a name to a piece of text.
  Here is a complete example:

    def animal : String := "otter"

  Read this as: define `animal`, with type `String`, to have the
  value "otter". A `String` is text enclosed in double quotes.
  The colon introduces the type; `:=` introduces the value.

  The definition below has the same shape, but its value is missing.
  `sorry` is a temporary placeholder. Lean warns about it, and
  Leanlings keeps the exercise incomplete until you fill it in.
  That warning is expected in an unfinished exercise.

  TODO: Replace only `sorry` with the string "Hello, Lean!".
  Keep the name `greeting` and its type `String`.
  Capitalization, the comma, the space, and the exclamation mark matter.

  Check your work. Once it passes, you have written your first Lean
  definition. To inspect its value in an editor, try `#eval greeting`.
-/

def greeting : String := sorry
