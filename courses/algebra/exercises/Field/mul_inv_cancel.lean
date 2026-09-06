/- # Supply evidence that an inverse law applies

A field is a nontrivial commutative ring in which every nonzero element
has a multiplicative inverse. `Field.mul_inv_cancel a` expects evidence
that `a ≠ 0`; the hypothesis `ha` supplies it.

Use that axiom to prove the first exercise. Unlike a group, a field
contains zero and does not promise this law for every element. Its
nontriviality axiom is `Field.zero_ne_one`.
-/
import CommRing.sq_expand

namespace Algebra

theorem mul_inv_cancel {F : Type _} [Field F] (a : F) (ha : a ≠ 0) : a * a⁻¹ = 1 := by
  sorry

end Algebra
