structure Person where
  firstName : String
  lastName : String
  age : Nat

def fullName (p : Person) : String := p.firstName ++ " " ++ p.lastName

def isAdult (p : Person) : Bool := p.age >= 18
