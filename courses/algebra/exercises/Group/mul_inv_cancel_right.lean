import Group.inv_mul_cancel_right

namespace Algebra

/- # Choose the other inverse law

Here the pair on the right is `b * b⁻¹`. Group it together and use the law with
that order. The result should simplify to `a` by an identity law. Practicing
both orders matters because a group need not be commutative.
-/
theorem mul_inv_cancel_right {G : Type _} [Group G] (a b : G) : a * b * b⁻¹ = a := by
  sorry

end Algebra
