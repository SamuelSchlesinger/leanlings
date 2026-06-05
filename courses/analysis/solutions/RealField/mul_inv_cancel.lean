import Real.Inv
namespace Analysis
open MyReal
theorem MyReal.mul_inv_cancel (x : MyReal) (hx : x ≠ 0) : x * x⁻¹ = 1 := by
  induction x using MyReal.ind with | _ f hf =>
  have hnn : ¬ CauSeq.Null ⟨f, hf⟩ := fun h => hx (mk_eq_zero_iff.mpr h)
  obtain ⟨q, hq, N, hN⟩ := CauSeq.apart hnn
  rw [inv_mk_of_not_null hnn, mul_mk, one_def]
  apply eq_of_equiv
  intro ε hε
  refine ⟨N, fun n hn => ?_⟩
  have hf0 : f n ≠ 0 := MyRat.ne_zero_of_pos_abs hq (hN n hn)
  show |f n * (f n)⁻¹ - constSeq 1 n| < ε
  simp only [constSeq]
  rw [MyRat.mul_inv_cancel (f n) hf0, MyRat.sub_self, MyRat.abs_zero]
  exact hε
end Analysis
