/- # Inductive Types 1: Enumerations

  Inductive types define a type with a fixed set of constructors:

    inductive Season where
      | spring
      | summer
      | autumn
      | winter

  Use pattern matching to handle each case:

    def isWarm : Season → Bool
      | .spring => true
      | .summer => true
      | _ => false

  TODO: Implement `opposite` that returns the opposite direction.
-/

inductive Direction where
  | north
  | south
  | east
  | west
  deriving Repr, BEq

open Direction in
def opposite (d : Direction) : Direction := sorry

-- Don't change below this line!
open Direction in
#guard opposite north == south && opposite south == north && opposite east == west && opposite west == east
