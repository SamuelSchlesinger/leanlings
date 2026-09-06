import Ring.neg_eq_of_add_eq_zero

namespace Algebra

/- # Negate a sum by finding its inverse

Show that adding `-b + -a` to `a + b` gives zero, then use the preceding
characterization of a negative. The reversed order mirrors the
inverse-of-a-product proof in groups. Addition is commutative here, so you
could also derive the more familiar order afterwards.
-/
theorem neg_add {R : Type _} [Ring R] (a b : R) : -(a + b) = -b + -a := by
  sorry

end Algebra
