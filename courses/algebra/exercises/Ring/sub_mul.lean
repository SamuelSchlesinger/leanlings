import Ring.mul_sub

namespace Algebra

/- # Keep the common right factor on the right

Expand subtraction and use right distributivity. The negative sign is now in
the first factor of a product, so `neg_mul` is the matching sign rule. Compare
the proof with the preceding exercise without invoking commutativity of
multiplication.
-/
theorem sub_mul {R : Type _} [Ring R] (a b c : R) : (a - b) * c = a * c - b * c := by
  sorry

end Algebra
