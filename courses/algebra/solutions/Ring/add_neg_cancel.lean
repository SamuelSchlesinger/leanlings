import Hom.map_div

namespace Algebra

theorem add_neg_cancel {R : Type _} [Ring R] (a : R) : a + -a = 0 := by
  rw [Ring.add_comm, Ring.neg_add_cancel]

end Algebra
