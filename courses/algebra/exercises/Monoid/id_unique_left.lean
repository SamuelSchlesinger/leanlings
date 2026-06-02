/- Monoid world.
   A monoid adds a two-sided identity `1`, with `one_mul : 1 * a = a` and
   `mul_one : a * 1 = a` (both available unqualified). -/
import Semigroup.reassoc_mixed

namespace Algebra

theorem id_unique_left {M : Type _} [Monoid M] (e : M) (h : ∀ a, e * a = a) : e = 1 := by
  sorry

end Algebra
