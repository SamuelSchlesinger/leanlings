structure Person where
  firstName : String
  lastName : String
  age : Nat
  deriving BEq

def fullName (p : Person) : String := p.firstName ++ " " ++ p.lastName

def isAdult (p : Person) : Bool := p.age >= 18

def birthday (p : Person) : Person := { p with age := p.age + 1 }
