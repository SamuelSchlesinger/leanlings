import Field.mul_eq_zero

namespace Algebra

/- # Specialize a general theorem

Apply the zero-product theorem to `a * a`. It returns two alternatives, but
both are the same equality `a = 0`. Handle either case. This shows how a useful
general result can turn a seemingly new algebraic proof into a short logical
argument.
-/
theorem mul_self_eq_zero {F : Type _} [Field F] (a : F) (h : a * a = 0) : a = 0 := by
  sorry

end Algebra
