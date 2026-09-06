import Field.mul_ne_zero

namespace Algebra

/- # A zero product has a zero factor

Split on whether `a = 0`. That case supplies the left alternative immediately.
Otherwise the inverse of `a` lets you derive `b = 0`, giving the right
alternative. The target is a disjunction: your case split determines which
proof to supply.
-/
theorem mul_eq_zero {F : Type _} [Field F] (a b : F) (h : a * b = 0) : a = 0 ∨ b = 0 := by
  sorry

end Algebra
