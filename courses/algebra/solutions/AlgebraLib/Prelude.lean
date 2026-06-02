/-
Everything an `algebra` level needs in scope: the algebraic hierarchy. Level
files import this (transitively, via the previous level) and add their theorem.
-/
import AlgebraLib.Basic
import AlgebraLib.Hom

namespace Algebra

/-- A concrete `CommMonoid` to ground the early worlds: `Bool` under `&&`,
with identity `true`. (`Bool` has no built-in `*`, so there's no clash.) -/
instance : CommMonoid Bool where
  mul := (· && ·)
  mul_assoc := by decide
  one := true
  one_mul := by decide
  mul_one := by decide
  mul_comm := by decide

end Algebra
