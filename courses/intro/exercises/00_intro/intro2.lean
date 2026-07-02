/- # Intro 2: Type Errors

  Lean is a strongly typed language. Every value has a type,
  and the compiler checks that types match.

  The code below has a type error — it tries to assign a String
  where a Nat (natural number) is expected.

  TODO: Change the value from the String "seven" to the number 7,
        so it matches the type `Nat`.
        (Keep the type annotation as `Nat`.)
-/

def favoriteNumber : Nat := "seven"
