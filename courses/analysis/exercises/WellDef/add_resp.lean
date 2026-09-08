import Rat.Quotient

namespace Analysis

/- # WellDef world — building ℚ, step 2

You proved `r` is an equivalence, so `MyRat := Quotient PreRat.setoid` now
exists (given in `Rat.Quotient`, with `mk`, `mk_eq`, and `ind`).

To define `+`, `×`, `-`, `<`, `≤` on `MyRat`, each operation must respect `r`:
equivalent inputs give equivalent outputs. This world proves that, which is
exactly what lets each operation descend to the quotient. The unit notes
show the operations on representatives and the shape of such a proof.

Addition first: `hac` and `hbd` say the inputs are equivalent; show that the
sums are. -/
theorem PreRat.add_resp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d) :
    PreRat.r (PreRat.add a b) (PreRat.add c d) := by
  sorry

end Analysis
