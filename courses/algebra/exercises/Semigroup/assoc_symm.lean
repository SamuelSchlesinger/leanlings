import Semigroup.reassoc_pair

namespace Algebra

/- # Read an equality in either direction

The axiom `mul_assoc` is written with left grouping on the left and right
grouping on the right. This goal asks for the reverse direction. An equality
can be used backwards with `rw [← mul_assoc]` or reversed as a proof with
`Eq.symm`. No new algebraic law is needed.
-/
theorem assoc_symm {α : Type _} [Semigroup α] (a b c : α) : a * (b * c) = a * b * c := by
  sorry

end Algebra
