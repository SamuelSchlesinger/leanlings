/- Ring world.
   A ring has two operations. Its addition is a commutative group
   (`Ring.add_assoc`, `Ring.zero_add`, `Ring.add_zero`, `Ring.neg_add_cancel`,
   `Ring.add_comm`) and its multiplication a monoid, tied together by
   distributivity (`Ring.left_distrib`, `Ring.right_distrib`). -/
import Hom.map_div

namespace Algebra

theorem add_neg_cancel {R : Type _} [Ring R] (a : R) : a + -a = 0 := by
  sorry

end Algebra
