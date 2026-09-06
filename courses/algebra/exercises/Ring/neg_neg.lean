import Ring.mul_neg

namespace Algebra

/- # Negation undoes itself

Translate the double-inverse argument for groups into additive language. The
elements `- -a` and `a` both cancel `-a`; use that fact to identify them. This
theorem will let you simplify two negative signs in later expressions.
-/
theorem neg_neg {R : Type _} [Ring R] (a : R) : - -a = a := by
  sorry

end Algebra
