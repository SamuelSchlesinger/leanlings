import Hom.map_inv

namespace Algebra

/- # Combine the preservation laws

The function is applied to a product, so first use its multiplication law. Then
apply the inverse-preservation theorem to the image of the second factor. This
is practice recognizing a larger expression as a composition of operations
already understood.
-/
theorem map_mul_inv {G H : Type _} [Group G] [Group H] (f : GroupHom G H) (a b : G) : f.toFun (a * b⁻¹) = f.toFun a * (f.toFun b)⁻¹ := by
  sorry

end Algebra
