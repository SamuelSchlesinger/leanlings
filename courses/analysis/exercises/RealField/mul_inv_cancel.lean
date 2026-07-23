import Real.Inv

namespace Analysis
open MyReal

/- # RealField world — inverses for nonzero reals

`Real.Inv` constructs the multiplicative inverse on ℝ (the hardest piece, given
in full): a nonzero real is *apart* from `0` (`CauSeq.apart` — some representative
is eventually `≥ q > 0`), so its termwise reciprocal is Cauchy. The library
provides:
  • `mk_eq_zero_iff : mk f hf = 0 ↔ CauSeq.Null ⟨f, hf⟩`;
  • `inv_mk_of_not_null hnn : (mk f hf)⁻¹ = mk (fun n => (f n)⁻¹) _`.

Prove the nonzero inverse law: a nonzero real times its inverse is `1`. After
`induction x using MyReal.ind`, get apartness data `⟨q, hq, N, hN⟩` from
`CauSeq.apart` (using `hnn : ¬ CauSeq.Null ⟨f, hf⟩`, which follows from `hx` and
`mk_eq_zero_iff`). Rewrite the inverse with `inv_mk_of_not_null`, then `mul_mk`,
`one_def`; reduce to a `CauchyEquiv` with `eq_of_equiv`. For `n ≥ N`, `f n ≠ 0`
(`MyRat.ne_zero_of_pos_abs hq (hN n hn)`), so `f n * (f n)⁻¹ = 1`
(`MyRat.mul_inv_cancel`) and the difference is `0`. -/
theorem MyReal.mul_inv_cancel (x : MyReal) (hx : x ≠ 0) : x * x⁻¹ = 1 := by
  sorry

end Analysis
