-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.add_left_comm

namespace MyNat

/-
In some later worlds, we're going to see some much nastier levels,
like `(a + a + 1) + (b + b + 1) = (a + b + 1) + (a + b + 1)`.
Brackets need to be moved around, and variables need to be swapped.

In this level, `(a + b) + (c + d) = ((a + c) + d) + b`,
let's forget about the brackets and just think about
the variable order.
To turn `a+b+c+d` into `a+c+d+b` we need to swap `b` and `c`,
and then swap `b` and `d`. But this is easier than you
think with `add_left_comm`.
-/
/- If $a, b$, $c$ and $d$ are numbers, we have
$(a + b) + (c + d) = ((a + c) + d) + b.$ -/
theorem exercise_algorithm_add_algo1 (a b c d : ℕ) : a + b + (c + d) = a + c + d + b := by
  sorry

end MyNat
