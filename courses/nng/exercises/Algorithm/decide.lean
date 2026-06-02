-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.succ_ne_succ

namespace MyNat

/-
Implementing the algorithm for equality of naturals, and the proof that it is correct,
looks like this:

```
instance instDecidableEq : DecidableEq ℕ
| 0, 0 => isTrue <| by
  show 0 = 0
  rfl
| succ m, 0 => isFalse <| by
  show succ m ≠ 0
  exact succ_ne_zero m
| 0, succ n => isFalse <| by
  show 0 ≠ succ n
  exact zero_ne_succ n
| succ m, succ n =>
  match instDecidableEq m n with
  | isTrue (h : m = n) => isTrue <| by
    show succ m = succ n
    rw [h]
    rfl
  | isFalse (h : m ≠ n) => isFalse <| by
    show succ m ≠ succ n
    exact succ_ne_succ m n h
```

This Lean code is a formally verified algorithm for deciding equality
between two naturals. I've typed it in already, behind the scenes.
Because the algorithm is formally verified to be correct, we can
use it in Lean proofs. You can run the algorithm with the `decide` tactic.
-/
/- $20+20=40$. -/
example : (20 : ℕ) + 20 = 40 := by
  sorry

end MyNat
