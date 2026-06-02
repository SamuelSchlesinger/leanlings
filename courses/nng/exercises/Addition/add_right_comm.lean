-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Addition.add_assoc

namespace MyNat

/-
`add_comm b c` is a proof that `b + c = c + b`. But if your goal
is `a + b + c = a + c + b` then `rw [add_comm b c]` will not
work! Because the goal means `(a + b) + c = (a + c) + b` so there
is no `b + c` term *directly* in the goal.

Use associativity and commutativity to prove `add_right_comm`.
You don't need induction. `add_assoc` moves brackets around,
and `add_comm` moves variables around.

Remember that you can do more targeted rewrites by
adding explicit variables as inputs to theorems. For example `rw [add_comm b]`
will only do rewrites of the form `b + ? = ? + b`, and `rw [add_comm b c]`
will only do rewrites of the form `b + c = c + b`.
-/
/-- If $a, b$ and $c$ are arbitrary natural numbers, we have
$(a + b) + c = (a + c) + b$. -/
theorem add_right_comm (a b c : ℕ) : a + b + c = a + c + b := by
  sorry

end MyNat
