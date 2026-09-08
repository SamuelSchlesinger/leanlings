/-! Copyable examples from the introductory explanations. Keep these in sync
with the examples in the indicated lessons: code in comments is not compiled
by the ordinary course build. -/

namespace ImplicitArguments
def identity {α : Type} (x : α) : α := x
def identityExplicit (α : Type) (x : α) : α := x
#guard identity 42 == 42
#guard identity "hello" == "hello"
#guard identityExplicit Nat 42 == 42
end ImplicitArguments

namespace Arrays
#guard #[1, 2, 3][0]? == some 1
#guard #[1, 2, 3][3]? == none
#guard Array.replicate 5 0 == #[0, 0, 0, 0, 0]
#guard Array.range 5 == #[0, 1, 2, 3, 4]
#guard #[1, 2] ++ #[3, 4] == #[1, 2, 3, 4]
def squares := Id.run do
  let mut a := #[]
  for i in List.range 5 do
    a := a.push (i * i)
  return a
#guard squares == #[0, 1, 4, 9, 16]
end Arrays

namespace DoNotation
def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)
def divideAndAdd : Option Nat := do
  let x ← safeDivide 10 2
  let y ← safeDivide x 1
  return x + y
#guard divideAndAdd == some 10
end DoNotation

namespace Structures
structure Person where
  firstName : String
  lastName : String
  age : Nat
  deriving BEq
def younger (p : Person) : Person := { p with age := 10 }
#guard younger ⟨"Jane", "Doe", 30⟩ == ⟨"Jane", "Doe", 10⟩
end Structures

namespace BasicNotation
#guard (3 - 5 : Nat) == 0
#guard (5 / 2 : Nat) == 2
#guard (7 % 3 : Nat) == 1
def isAdult (age : Nat) : Bool := age >= 18
def isAdultExplicit (age : Nat) : Bool := decide (age >= 18)
example (age : Nat) : isAdult age = isAdultExplicit age := rfl
def pair : Nat × String := (7, "seven")
#guard pair.1 == 7
#guard pair.2 == "seven"
example (P : Prop) (hp : P) : P ∧ True := by
  constructor
  · exact hp
  · exact True.intro
example (x : α) : x ∈ [x] := by simp
end BasicNotation

theorem swap_parts (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  have hp : P := h.left
  have hq : Q := h.right
  exact ⟨hq, hp⟩
