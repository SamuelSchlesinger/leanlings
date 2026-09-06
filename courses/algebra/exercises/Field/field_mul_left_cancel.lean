import Field.mul_self_eq_zero

namespace Algebra

/- # Compare field cancellation with group cancellation

Undo the shared factor by multiplying on the left with `a⁻¹`, using `ha` at the
inverse step. This is the group cancellation strategy with one additional
obligation. Explain why deleting `ha` would make the statement false when `a =
0` in a nontrivial field.
-/
theorem field_mul_left_cancel {F : Type _} [Field F] (a b c : F) (ha : a ≠ 0) (h : a * b = a * c) : b = c := by
  sorry

end Algebra
