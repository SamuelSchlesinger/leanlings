import Semigroup.assoc_symm

namespace Algebra

theorem id_unique_left {M : Type _} [Monoid M] (e : M) (h : ∀ a, e * a = a) : e = 1 := by
  have he := h 1
  rw [mul_one] at he
  exact he

end Algebra
