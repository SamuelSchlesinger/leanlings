def getOrDefault (opt : Option Nat) (default : Nat) : Nat :=
  match opt with
  | some x => x
  | none   => default
