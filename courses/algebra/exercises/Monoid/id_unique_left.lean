/- # An identity is unique

A monoid adds a two-sided identity `1`, with laws
`one_mul : 1 * a = a` and `mul_one : a * 1 = a`.

Suppose another element `e` acts as an identity on the left of every
element. Show that it equals the supplied identity. Choose a useful
input for the universal hypothesis `h`, then simplify using a monoid
law. You do not need inverses or commutativity.
-/
import Semigroup.reassoc_mixed

namespace Algebra

theorem id_unique_left {M : Type _} [Monoid M] (e : M) (h : ∀ a, e * a = a) : e = 1 := by
  sorry

end Algebra
