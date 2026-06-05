import Rat.Quotient

namespace Analysis

/- # WellDef world — building ℚ, step 2

You proved `r` is an equivalence, so `MyRat := Quotient PreRat.setoid` now exists
(given for you in `Rat.Quotient`, along with `mk`, `mk_eq`, and `ind`).

To define `+`, `×`, `-`, `<`, `≤` on `MyRat`, each operation must *respect* `r`:
equivalent inputs give equivalent outputs. That is this world. Proving these is
exactly what lets the operations "descend to the quotient".

PATTERN (learn it here, reuse it below): unfold the relation and the operation,
then let `grind` close the resulting polynomial identity over `ℤ`:

    simp only [PreRat.r, PreRat.add] at *
    grind

`hac` and `hbd` are the relations on the inputs; after `simp` they become integer
equations that `grind` combines. -/
theorem PreRat.add_resp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d) :
    PreRat.r (PreRat.add a b) (PreRat.add c d) := by
  sorry

end Analysis
