import Real.Mul

namespace Analysis
open MyReal

/- # Real world — ℝ as the quotient of Cauchy sequences

`Real.Defs`/`Real.Mul` build `MyReal` and its operations and give you the API:

  • `induction x using MyReal.ind with | _ f hf =>`  reduces `x` to `mk f hf`;
  • `add_mk`, `neg_mk`, `mul_mk`, `zero_def`, `one_def`, `ofRat_def`  compute;
  • `eq_of_equiv : CauchyEquiv f g → mk f hf = mk g hg`;
  • `equiv_of_eq : (∀ n, f n = g n) → CauchyEquiv f g`.

THE PATTERN: a real identity reduces to a *pointwise* rational identity. Replace
the reals by Cauchy sequences, compute, then it suffices that the two sequences
are equal at every `n` — where the matching `MyRat` theorem (which you proved!)
applies:

    induction x using MyReal.ind with | _ f hf =>
    induction y using MyReal.ind with | _ g hg =>
    rw [add_mk, add_mk]
    exact eq_of_equiv (equiv_of_eq (fun n => MyRat.add_comm _ _))
-/
theorem MyReal.add_comm (x y : MyReal) : x + y = y + x := by
  sorry

end Analysis
