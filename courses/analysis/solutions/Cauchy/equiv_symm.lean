import Cauchy.equiv_refl
namespace Analysis
open MyRat
theorem equiv_symm {f g : ℕ → MyRat} (h : CauchyEquiv f g) : CauchyEquiv g f := by
  intro ε hε
  obtain ⟨N, hN⟩ := h ε hε
  refine ⟨N, fun n hn => ?_⟩
  rw [MyRat.abs_sub_comm]
  exact hN n hn
end Analysis
