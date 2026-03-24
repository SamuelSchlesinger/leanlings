/- # Structures 2: Using Fields

  Access structure fields with dot notation:
    let p : Point := ⟨3.0, 4.0⟩
    p.x    -- 3.0
    p.y    -- 4.0

  TODO: Implement `fullName` that concatenates first and last name,
        and `isAdult` that checks if age >= 18.
-/

structure Person where
  firstName : String
  lastName : String
  age : Nat

def fullName (p : Person) : String := sorry

def isAdult (p : Person) : Bool := sorry
