-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.add_algo2

namespace MyNat

/-
You can package a proof strategy as a tactic. The `macro` declaration below
defines `simp_add` by expanding it to the three addition rearrangement rules
you already know. It introduces no new mathematical assumption: Lean still
checks the proof produced by `simp`.

Keep the supplied declaration and use `simp_add` in the proof. Compare the
result with the preceding exercise. Which part of the work does the macro
save, and which mathematical facts does it still need?
-/

macro "simp_add" : tactic =>
  `(tactic| simp only [add_assoc, add_left_comm, add_comm])

/- If $a, b,\ldots h$ are arbitrary natural numbers, we have
$(d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h$. -/
theorem exercise_algorithm_add_algo3 (a b c d e f g h : ℕ) :
    (d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h := by
  sorry

end MyNat
