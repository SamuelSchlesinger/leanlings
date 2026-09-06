import Group.eq_inv_of_mul_eq_one

namespace Algebra

/- # Reuse a theorem with reversed conclusion

The previous theorem already identifies `b` as the inverse of `a`. This goal
asks for the equality in the other direction. Obtain that proof from `h` and
reverse it. Reusing a proved characterization is clearer than repeating the
cancellation argument.
-/
theorem inv_eq_of_mul_eq_one {G : Type _} [Group G] (a b : G) (h : a * b = 1) : a⁻¹ = b := by
  sorry

end Algebra
