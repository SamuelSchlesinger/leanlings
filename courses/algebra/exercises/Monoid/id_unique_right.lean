import Monoid.id_unique_left

namespace Algebra

theorem id_unique_right {M : Type _} [Monoid M] (e : M) (h : ∀ a, a * e = a) : e = 1 := by
  sorry

end Algebra
