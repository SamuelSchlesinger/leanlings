/- # Does preserving products preserve the identity?

A `GroupHom G H` bundles `f.toFun : G → H` with the law
`f.map_mul : f.toFun (a * b) = f.toFun a * f.toFun b`.
It does not separately assume preservation of `1`.

Apply the multiplication law to `1 * 1`. It says `f.toFun 1` is
idempotent in the target group. Use group cancellation to identify
that element with the target identity. Remember that a general
monoid may have other idempotents; the target inverses matter.
-/
import Division.div_mul_cancel

namespace Algebra

theorem map_one {G H : Type _} [Group G] [Group H] (f : GroupHom G H) : f.toFun 1 = 1 := by
  sorry

end Algebra
