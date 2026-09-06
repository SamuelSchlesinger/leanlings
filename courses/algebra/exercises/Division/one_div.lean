import Division.div_one

namespace Algebra

/- # Dividing the identity

After expanding division, the expression is the identity multiplied by `a⁻¹`.
Use the identity law. Notice that `1 / a` denotes the inverse of `a` even when
the group operation is composition rather than numerical multiplication.
-/
theorem one_div {G : Type _} [Group G] (a : G) : 1 / a = a⁻¹ := by
  sorry

end Algebra
