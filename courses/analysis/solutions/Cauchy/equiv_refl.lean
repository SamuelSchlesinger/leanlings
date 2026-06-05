import Cauchy.neg_isCauchy
namespace Analysis
open MyRat
theorem equiv_refl (f : ℕ → MyRat) : CauchyEquiv f f := by
  intro ε hε
  refine ⟨0, fun n _ => ?_⟩
  rw [MyRat.sub_self, MyRat.abs_zero]
  exact hε
end Analysis
