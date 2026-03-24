structure Person where
  name : String
  age : Nat
  deriving Repr

def alice : Person := { name := "Alice", age := 30 }
