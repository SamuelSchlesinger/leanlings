/-
AlgebraLib: a from-scratch algebraic hierarchy in core Lean 4 — no Mathlib.

Following Bourbaki, we climb the tower one axiom at a time: a magma is a set with
a binary operation; adding associativity gives a semigroup; an identity gives a
monoid; inverses give a group; a second, distributing operation gives a ring; and
multiplicative inverses give a field.

We reuse core Lean's notation classes (`Mul`, `One`, `Inv`, `Add`, `Zero`, `Neg`)
so goals read with ordinary symbols (`a * b`, `1`, `a⁻¹`, `a + b`, `0`, `-a`).
Each level proves theorems *generically* over these classes, e.g.
`theorem inv_inv {G} [Group G] (a : G) : a⁻¹⁻¹ = a`.
-/
universe u

namespace Algebra

/-! ### Multiplicative tower: magma → group -/

/-- A **magma**: a type with a binary operation `*`. No axioms. -/
class Magma (α : Type u) extends Mul α

/-- A **semigroup**: an associative magma. -/
class Semigroup (α : Type u) extends Magma α where
  mul_assoc : ∀ a b c : α, a * b * c = a * (b * c)

/-- A **monoid**: a semigroup with a two-sided identity `1`. -/
class Monoid (α : Type u) extends Semigroup α, One α where
  one_mul : ∀ a : α, 1 * a = a
  mul_one : ∀ a : α, a * 1 = a

/-- A **commutative monoid**. -/
class CommMonoid (α : Type u) extends Monoid α where
  mul_comm : ∀ a b : α, a * b = b * a

/-- A **group**: a monoid in which every element has a two-sided inverse. -/
class Group (α : Type u) extends Monoid α, Inv α where
  inv_mul_cancel : ∀ a : α, a⁻¹ * a = 1
  mul_inv_cancel : ∀ a : α, a * a⁻¹ = 1

/-- A **commutative (abelian) group**. -/
class CommGroup (α : Type u) extends Group α where
  mul_comm : ∀ a b : α, a * b = b * a

-- The associativity / identity lemmas are unique to the multiplicative tower,
-- so we expose them unqualified. (Inverse and commutativity laws are referred to
-- by their qualified names — `Group.inv_mul_cancel`, `CommGroup.mul_comm`, … —
-- since those names recur elsewhere in the hierarchy.)
export Semigroup (mul_assoc)
export Monoid (one_mul mul_one)

/-! ### Ring tower

A ring's multiplication is a `Monoid`, so the multiplicative lemmas above apply.
Its addition is a commutative group, written additively; those axioms live on the
`Ring` class itself (`Ring.add_assoc`, `Ring.add_comm`, …). -/

/-- A **ring**: an additive commutative group and a multiplicative monoid, with
multiplication distributing over addition. -/
class Ring (α : Type u) extends Monoid α, Add α, Zero α, Neg α where
  add_assoc : ∀ a b c : α, a + b + c = a + (b + c)
  zero_add : ∀ a : α, 0 + a = a
  add_zero : ∀ a : α, a + 0 = a
  neg_add_cancel : ∀ a : α, -a + a = 0
  add_comm : ∀ a b : α, a + b = b + a
  left_distrib : ∀ a b c : α, a * (b + c) = a * b + a * c
  right_distrib : ∀ a b c : α, (a + b) * c = a * c + b * c

/-- A **commutative ring**. -/
class CommRing (α : Type u) extends Ring α where
  mul_comm : ∀ a b : α, a * b = b * a

/-- A **field**: a nontrivial commutative ring in which every nonzero element has
a multiplicative inverse. By convention `0⁻¹ = 0`. -/
class Field (α : Type u) extends CommRing α, Inv α where
  mul_inv_cancel : ∀ a : α, a ≠ 0 → a * a⁻¹ = 1
  inv_zero : (0 : α)⁻¹ = 0
  zero_ne_one : (0 : α) ≠ 1

end Algebra
