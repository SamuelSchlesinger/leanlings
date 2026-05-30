def doubleArray (a : Array Nat) : Array Nat :=
  a.map (· * 2)

def arraySum (a : Array Nat) : Nat :=
  a.foldl (· + ·) 0

def filterAbove (a : Array Nat) (threshold : Nat) : Array Nat :=
  a.filter (· > threshold)
