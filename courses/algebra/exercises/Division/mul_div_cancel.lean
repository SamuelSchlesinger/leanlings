import Division.one_div

namespace Algebra

/- # A final division undoes multiplication

Expand division in `(a * b) / b`. The resulting expression has a pair `b * b⁻¹`
waiting to be grouped and canceled. A previously proved cancellation lemma can
package those steps. The order of the factors is part of the argument.
-/
theorem mul_div_cancel {G : Type _} [Group G] (a b : G) : a * b / b = a := by
  sorry

end Algebra
