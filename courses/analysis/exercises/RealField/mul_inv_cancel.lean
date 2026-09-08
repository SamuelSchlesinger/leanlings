import Real.Inv

namespace Analysis
open MyReal

/- # RealField world — inverses for nonzero reals

`Real.Inv` constructs the multiplicative inverse on ℝ (the hardest piece,
given in full): a nonzero real is apart from `0`, meaning the absolute value
of its representative is eventually at least some `q > 0`, so its termwise
reciprocal is Cauchy. The unit notes list the interface.

Prove the nonzero inverse law. The product `f n * (f n)⁻¹` equals `1` only
where `f n ≠ 0`, which apartness guarantees past a threshold; equality of
reals only needs the two sequences to agree eventually. -/
theorem MyReal.mul_inv_cancel (x : MyReal) (hx : x ≠ 0) : x * x⁻¹ = 1 := by
  sorry

end Analysis
