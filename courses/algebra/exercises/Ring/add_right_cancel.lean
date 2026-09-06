import Ring.add_left_cancel

namespace Algebra

/- # Cancel a common summand on the right

Add `-c` on the right of both sides and simplify, or commute the common summand
to use left cancellation. Explain why subtraction is unnecessary for this
proof: additive inverses and associativity already supply the needed operation.
-/
theorem add_right_cancel {R : Type _} [Ring R] (a b c : R) (h : a + c = b + c) : a = b := by
  sorry

end Algebra
