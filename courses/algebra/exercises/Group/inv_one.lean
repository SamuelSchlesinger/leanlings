import Group.mul_inv_cancel_right

namespace Algebra

/- # The identity undoes itself

An inverse of `1` must satisfy the same inverse law as any element. Specialize
that law to `1`, then simplify the multiplication by the identity. You are
deriving a fact about the inverse operation from its laws, rather than
evaluating an arbitrary group element.
-/
theorem inv_one {G : Type _} [Group G] : (1 : G)⁻¹ = 1 := by
  sorry

end Algebra
