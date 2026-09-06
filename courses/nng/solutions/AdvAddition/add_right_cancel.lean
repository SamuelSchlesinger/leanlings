-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.two_add_two_ne_five

namespace MyNat

/-- $a+n=b+n\implies a=b$. -/
theorem add_right_cancel (a b n : ℕ) : a + n = b + n → a = b := by
  induction n using MyNat.rec' with
  | zero =>
    intro h
    repeat rewrite [add_zero] at h
    exact h
  | succ d hd =>
    intro h
    repeat rewrite [add_succ] at h
    have h := succ_inj h
    have h := hd h
    exact h

end MyNat
