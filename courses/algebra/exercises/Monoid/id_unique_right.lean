import Monoid.id_unique_left

namespace Algebra

/- # Test a proposed identity on the known identity

The hypothesis says `e` acts as an identity on the right of every element.
Specialize it to the existing identity `1`. Simplifying the resulting equation
identifies `e`. Compare with the left-identity proof: the test element is the
same, but the identity law you simplify with changes.
-/
theorem id_unique_right {M : Type _} [Monoid M] (e : M) (h : ∀ a, a * e = a) : e = 1 := by
  sorry

end Algebra
