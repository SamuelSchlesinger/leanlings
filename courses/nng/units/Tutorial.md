# Reading a proof task

In `(x : ℕ) (h : x = 3)`, `x` is a number and `h` is evidence of an
equality. After the final colon comes the proposition to prove. The tactics
after `by` construct its proof.

```lean
import MyNatLib.Prelude
open MyNat
example (x : ℕ) (h : x = 3) : succ x = succ 3 := by
  rewrite [h]
  rfl
```

The rewrite changes the goal to `succ 3 = succ 3`; `rfl` closes that
equality. `rw [h]` combines the rewrite with a reflexivity attempt.
To rewrite in the other direction, put `←` before the equality's name.

The upcoming numeral lemmas describe how `1`, `2`, `3`, and `4` are built
from successors. Then the addition axioms give you a way to simplify sums.
At each step, identify the exact subexpression the chosen lemma matches.
