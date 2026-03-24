inductive Result where
  | ok (value : Nat)
  | error (message : String)
  deriving Repr

def getValueOr (r : Result) (default : Nat) : Nat :=
  match r with
  | .ok v    => v
  | .error _ => default

def isOk : Result → Bool
  | .ok _    => true
  | .error _ => false
