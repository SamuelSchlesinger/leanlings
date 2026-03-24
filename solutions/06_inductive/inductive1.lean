inductive Direction where
  | north
  | south
  | east
  | west
  deriving Repr, BEq

open Direction in
def opposite (d : Direction) : Direction :=
  match d with
  | north => south
  | south => north
  | east  => west
  | west  => east
