# Cancellation without subtraction

The statement `a + n = b + n → a = b` says that a shared summand can be
cancelled. Prove this with the successor equations and injectivity; there
is no subtraction operation to use in this development.

```lean
import Implication.two_add_two_ne_five
open MyNat
example (a b : ℕ) (h : a + 0 = b + 0) : a = b := by
  rewrite [add_zero, add_zero] at h
  exact h
```

This is the shape of the zero case of cancellation. In a successor case,
strip the matching successors to obtain an equality for the induction
hypothesis.

Once cancellation is established, reuse it. To prove a summand is zero,
rewrite the other side as a sum with zero so that the shared summand is
visible. Use `cases` when only the zero/successor distinction is needed;
use `induction` when a proof about the predecessor is needed too.

Here is the zero/successor distinction without an induction hypothesis:

```lean
import MyNatLib.Prelude
open MyNat
example (n : ℕ) : n = 0 ∨ ∃ d, n = succ d := by
  cases n using MyNat.casesOn' with
  | zero => exact Or.inl rfl
  | succ d => exact Or.inr ⟨d, rfl⟩
```

Each branch returns different evidence for the disjunction. In a cancellation
proof, deciding whether you need this distinction alone or an induction
hypothesis is part of choosing the proof strategy.
