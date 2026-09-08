import Capstone.ofRat_pos

namespace Analysis
open MyReal

/- The completeness theorem: a Cauchy sequence of rationals `f` converges, in
ℝ, to the real `mk f hf` it represents. This is the sense in which ℝ
completes ℚ.

Fix a tolerance and a term `f k` past a threshold of your choosing. Since
the order on reals is defined through positivity, after computing a
representative of the difference you must exhibit a positive rational
margin that the representative eventually stays above. The Cauchy
condition on `f` supplies both the threshold and the margin. -/
theorem MyReal.cauchy_seq_converges (f : ℕ → MyRat) (hf : IsCauchy f) :
    Tendsto (fun k => ofRat (f k)) (mk f hf) := by
  sorry

end Analysis
