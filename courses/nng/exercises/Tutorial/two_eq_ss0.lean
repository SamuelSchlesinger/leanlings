-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.rw

namespace MyNat

/-
## The birth of number.

Numbers in Lean are defined by two rules.

* `0` is a number.
* If `n` is a number, then the *successor* `succ n` of `n` is a number.

The successor of `n` means the number after `n`. Let's learn to
count, and name a few small numbers.

## Counting to four.

`0` is a number, so `succ 0` is a number. Let's call this new number `1`.
Similarly let's define `2 = succ 1`, `3 = succ 2` and `4 = succ 3`.
This gives us plenty of numbers to be getting along with.

The *proof* that `2 = succ 1` is called `two_eq_succ_one`.

Let's prove that $2$ is the number after the number after zero.
-/
/- $2$ is the number after the number after $0$. -/
example
    : 2 = succ (succ 0) := by
  sorry

end MyNat
