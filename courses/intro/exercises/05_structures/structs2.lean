/- # Structures 2: Using Fields

  Access structure fields with dot notation:
    let p : Point := ⟨3.0, 4.0⟩
    p.x    -- 3.0
    p.y    -- 4.0

  You can also create a modified copy with `{ s with field := val }`:
    let p2 := { p with age := 26 }  -- same name, new age

  TODO: Implement all three functions.
-/

structure Person where
  firstName : String
  lastName : String
  age : Nat
  deriving BEq  -- auto-generates `==`; you'll learn how in unit 12

def fullName (p : Person) : String := sorry

def isAdult (p : Person) : Bool := sorry

-- Return a new Person with age incremented by 1.
-- Use `{ p with ... }` to copy all fields except the one you change.
def birthday (p : Person) : Person := sorry

-- Don't change below this line!
#guard fullName { firstName := "Jane", lastName := "Doe", age := 25 } == "Jane Doe"
#guard isAdult { firstName := "A", lastName := "B", age := 18 } == true
#guard isAdult { firstName := "A", lastName := "B", age := 17 } == false
#guard birthday { firstName := "A", lastName := "B", age := 25 } == { firstName := "A", lastName := "B", age := 26 }
