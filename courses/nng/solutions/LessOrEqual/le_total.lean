-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.or_symm

namespace MyNat

/-- If $x$ and $y$ are numbers, then either $x \leq y$ or $y \leq x$. -/
theorem le_total (x y : ℕ) : x ≤ y ∨ y ≤ x := by
  induction y using MyNat.rec' with
  | zero => exact Or.inr (zero_le x)
  | succ d hd =>
    rcases hd with hxd | hdx
    · left
      obtain ⟨e, he⟩ := hxd
      rewrite [he]
      refine ⟨e + 1, ?_⟩
      rewrite [succ_eq_add_one, add_assoc]
      rfl
    · obtain ⟨e, he⟩ := hdx
      cases e using MyNat.casesOn' with
      | zero =>
        rewrite [add_zero] at he
        rewrite [he]
        exact Or.inl (le_succ_self d)
      | succ a =>
        right
        refine ⟨a, ?_⟩
        rewrite [add_succ] at he
        rewrite [succ_add]
        exact he

end MyNat
