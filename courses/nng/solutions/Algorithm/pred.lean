-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.add_algo3

namespace MyNat

/- If $\operatorname{succ}(a)=\operatorname{succ}(b)$ then $a=b$. -/
theorem exercise_algorithm_pred (a b : ℕ) (h : succ a = succ b) : a = b := by
  rewrite [← pred_succ a]
  rewrite [h]
  rewrite [pred_succ]
  rfl

end MyNat
