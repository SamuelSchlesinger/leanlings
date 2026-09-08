/- # Structures 2: Using Fields

  For the `Person` structure defined below, `p.firstName` is a String
  and `p.age` is a Nat. Dot notation selects one field of a value.

  You can also create a modified copy with `{ s with field := val }`.
  Try this example after the Person declaration:

    def younger (p : Person) : Person := { p with age := 10 }

  It keeps both names and changes only the age. It produces a new
  value; the original `p` is unchanged.

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
-- `p.age >= 18` is a decidable proposition. Lean can convert it to Bool
-- here; `decide (p.age >= 18)` makes that conversion explicit.
def isAdult (p : Person) : Bool := sorry

-- Return a new Person with age incremented by 1.
-- Use `{ p with ... }` to copy all fields except the one you change.
def birthday (p : Person) : Person := sorry
