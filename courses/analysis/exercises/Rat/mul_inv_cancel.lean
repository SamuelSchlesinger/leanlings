import Rat.right_distrib

namespace Analysis
open MyRat

/- The defining property of a field: every nonzero `x` has a multiplicative
inverse. This is the hardest Rat-world level.

Roadmap:
  1. Reduce `x` to `mk a b hb`.
  2. From `hx : mk a b hb ≠ 0` derive `ha : a ≠ 0`. (If `a = 0`, then
     `mk a b hb = 0` by `zero_def`/`mk_eq`.)
  3. `inv_mk_of_ne hb ha` rewrites `(mk a b hb)⁻¹` into closed form, then
     `mul_mk`, `one_def`, `mk_eq` reduce the goal to an integer identity.
  4. The key fact `Int.sign_mul_natAbs a : a.sign * ↑a.natAbs = a` lets `grind`
     finish (it relates `a`, its sign, and `|a|`).

The skeleton sets up steps 1–2; complete the proof. -/
theorem MyRat.mul_inv_cancel (x : MyRat) (hx : x ≠ 0) : x * x⁻¹ = 1 := by
  induction x using ind with | _ a b hb =>
  have ha : a ≠ 0 := by
    intro h; apply hx; rw [h, zero_def, mk_eq]; omega
  sorry

end Analysis
