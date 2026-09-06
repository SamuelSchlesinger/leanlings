import Group.eq_of_mul_inv_eq_one

namespace Algebra

/- # Use a characterization in the forward direction

This time the hypothesis already identifies one factor as the inverse of the
other. Substitute using `h`, then choose the inverse law that matches the
resulting order. Together with the preceding lessons, this connects an inverse
equation with an explicit formula for the inverse.
-/
theorem mul_eq_one_of_eq_inv {G : Type _} [Group G] (a b : G) (h : a = b⁻¹) : a * b = 1 := by
  sorry

end Algebra
