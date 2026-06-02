/- # Structures 1: Defining Structures

  Structures group related data together:

    structure Point where
      x : Float
      y : Float

  Create instances with named fields:
    { x := 1.0, y := 2.0 : Point }
  Or with the anonymous constructor ⟨...⟩ (typed \langle and \rangle):
    (⟨1.0, 2.0⟩ : Point)

  `deriving Repr` at the end lets you print values with `#eval`.
  (You'll learn more about `deriving` when we cover type classes.)

  TODO: Create a Person named "Alice" who is 30 years old.
        Use either named fields or the anonymous constructor.
-/

structure Person where
  name : String
  age : Nat
  deriving Repr

-- TODO: Replace sorry with a Person value
def alice : Person := sorry
