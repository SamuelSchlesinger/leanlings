import Monoid.one_idempotent

namespace Algebra

/- # The identity depends on the operation

For Boolean conjunction, the identity is `true`: combining with it leaves
either Boolean value unchanged. The symbol `1` here names that identity, not a
natural number. Inspect the type annotation and reduce the supplied instance to
prove the equality.
-/
theorem bool_one : (1 : Bool) = true := by
  sorry

end Algebra
