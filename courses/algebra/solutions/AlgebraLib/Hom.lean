/-
Group homomorphisms: structure-preserving maps between groups.
-/
import AlgebraLib.Basic

namespace Algebra

/-- A **group homomorphism**: a map preserving the operation. The identity- and
inverse-preservation laws are *theorems*, proved in the Hom world. -/
structure GroupHom (G H : Type _) [Group G] [Group H] where
  toFun : G → H
  map_mul : ∀ a b : G, toFun (a * b) = toFun a * toFun b

end Algebra
