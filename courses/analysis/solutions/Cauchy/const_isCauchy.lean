import Cauchy.Defs
namespace Analysis
open MyRat
theorem const_isCauchy (q : MyRat) : IsCauchy (constSeq q) := by
  intro ε hε
  refine ⟨0, fun m n _ _ => ?_⟩
  simp only [constSeq]
  rw [MyRat.sub_self, MyRat.abs_zero]
  exact hε
end Analysis
