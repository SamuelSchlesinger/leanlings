/- # Inductive Types 2: Data-Carrying Constructors

  Constructors can carry data:

    inductive Shape where
      | circle (radius : Float)
      | rectangle (width : Float) (height : Float)

  Pattern match to extract the data:

    match shape with
    | .circle r => ...
    | .rectangle w h => ...

  The `.` prefix works when the expected type is known.

  TODO: Implement `getValueOr` and `isOk` by pattern matching.
-/

inductive Result where
  | ok (value : Nat)
  | error (message : String)
  deriving Repr

def getValueOr (r : Result) (default : Nat) : Nat := sorry

def isOk : Result → Bool := sorry
