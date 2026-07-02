/- # Structures 2: Using Fields

  Access structure fields with dot notation:
    let p : Point := ⟨3.0, 4.0⟩
    p.x    -- 3.0
    p.y    -- 4.0

  You can also create a modified copy with `{ s with field := val }`:
    let p2 := { p with age := 26 }  -- same name, new age

  TODO: Implement all three functions; each has a comment
        saying what it should do.
-/

structure Person where
  firstName : String
  lastName : String
  age : Nat
  deriving BEq  -- auto-generates `==`; you'll learn how in unit 12

-- Return the first and last name separated by a single space,
-- e.g. "Jane" and "Doe" become "Jane Doe". (Join strings with `++`.)
def fullName (p : Person) : String := sorry

-- A person is an adult if their age is at least 18.
def isAdult (p : Person) : Bool := sorry

-- Return a new Person with age incremented by 1.
-- Use `{ p with ... }` to copy all fields except the one you change.
def birthday (p : Person) : Person := sorry
