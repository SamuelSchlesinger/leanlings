-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.succ_ne_succ

namespace MyNat

/-
A decision procedure for equality of `MyNat` values compares constructors:
zero equals zero; zero cannot equal a successor; two successors are equal
exactly when their predecessors are equal. Each branch returns a proof of
its answer. The foundation supplies this as `DecidableEq MyNat`.

For example, `example : (3 : ℕ) ≠ 4 := by decide` is checked by computation.

Our `+` is opaque and specified by axioms, so `decide` cannot compute a sum
on its own. First rewrite a numeral sum using `ofNat_succ`, `add_succ`, and
`add_zero`. These rules replace it with a chain of successors. For this
positive equality, simplification can finish the proof itself. In the next
exercise, `decide` will finish a remaining inequality between constructors.

Try `simp only [...]` with those three rules. Explain which rule unfolds a
numeral, which moves a successor out of a sum, and which stops the recursion.
-/
/- $20+20=40$. -/
theorem exercise_algorithm_decide : (20 : ℕ) + 20 = 40 := by
  sorry

end MyNat
