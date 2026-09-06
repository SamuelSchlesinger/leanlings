import Monoid.id_unique_right

namespace Algebra

/- # An identity is idempotent

An element is idempotent when multiplying it by itself gives it back. Apply an
identity law to show that `1` has this property. The converse is not a monoid
law: in Boolean conjunction, `false * false = false`, yet `false` is not the
identity. Inverses will later let us prove a stronger result in groups.
-/
theorem one_idempotent {M : Type _} [Monoid M] : (1 : M) * 1 = 1 := by
  sorry

end Algebra
