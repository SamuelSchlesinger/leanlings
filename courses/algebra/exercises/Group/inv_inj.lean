import Group.inv_inv

namespace Algebra

/- # A reversible operation is injective

The hypothesis equates the inverses of two elements. Apply the inverse
operation once more and use the theorem `inv_inv` on each side. The
mathematical idea is that a function with an undo operation cannot send
distinct inputs to the same output.
-/
theorem inv_inj {G : Type _} [Group G] (a b : G) (h : a⁻¹ = b⁻¹) : a = b := by
  sorry

end Algebra
