/- # Division is multiplication by an inverse

In a group, `a / b` is defined as `a * b⁻¹`. Expand it with `div_eq`,
then use the group laws you have proved.

Show that dividing an element by itself gives the identity. This group
statement has no nonzero hypothesis: every element has an inverse for
the chosen group operation. The later field unit will revisit that
distinction.
-/
import CommGroup.mul_mul_mul_comm

namespace Algebra

theorem div_self {G : Type _} [Group G] (a : G) : a / a = 1 := by
  sorry

end Algebra
