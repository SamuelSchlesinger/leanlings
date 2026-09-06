/-
The Peano API NNG provides as givens: predecessor, injectivity of `succ`, and
`0 ≠ succ n`. Ported from leanprover-community/NNG4 (Apache-2.0); upstream pulls
in Mathlib tactics, this uses only core Lean. See `courses/nng/LICENSE`.

These are part of the foundation, so they are proved with core `rw` (which, in
the library, may close `a = a` automatically). Inside the *levels*, `rw` is
written as `rewrite` so that closing `rfl`s stay explicit.
-/
import MyNatLib.Basic

namespace MyNat

/-- Predecessor. `pred 0` is junk (`37`); `pred (succ n) = n`. -/
def pred : ℕ → ℕ
  | 0 => 37
  | succ n => n

theorem pred_succ (n : ℕ) : pred (succ n) = n := rfl

/-- `succ` is injective. Its implicit arguments are inferred from the equality
when you write `succ_inj h`. -/
theorem succ_inj {a b : ℕ} (h : succ a = succ b) : a = b := by
  rw [← pred_succ a, h, pred_succ]

/-- `is_zero 0` is `True`; `is_zero (succ n)` is `False`. -/
def is_zero : ℕ → Prop
  | 0 => True
  | succ _ => False

theorem is_zero_zero : is_zero 0 = True := rfl
theorem is_zero_succ (n : ℕ) : is_zero (succ n) = False := rfl

/-- Zero is not a successor. -/
theorem zero_ne_succ (a : ℕ) : (0 : ℕ) ≠ succ a := by
  intro h
  rw [← is_zero_succ a]
  rw [← h]
  rw [is_zero_zero]
  trivial

end MyNat
