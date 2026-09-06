/- # Intro 2: Type Errors

  A type tells Lean what kind of value belongs in a definition.
  `String` is text; `Nat` is a natural number: 0, 1, 2, and so on.

  Quotes make a difference: "7" is text, while 7 can be a `Nat`.

  Read the definition below before changing it. The annotation
  `: Nat` asks for a number, but "seven" supplies text. When you
  check it, Lean reports a type mismatch: the supplied expression
  has type `String`, but the expected type is `Nat`.

  TODO: Make `favoriteNumber` equal the number 7.
  Keep its name and its type `Nat`; change the value after `:=`.

  Changing the type to `String` would make the original definition
  type-check, but would not meet this exercise's requirement.
-/

def favoriteNumber : Nat := "seven"
