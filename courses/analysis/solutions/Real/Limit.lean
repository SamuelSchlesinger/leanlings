/-
Infrastructure (given): convergence of sequences of reals. The capstone world
then proves that ℝ is complete over ℚ.

We measure closeness with a rational tolerance `ε` (embedded by `ofRat`), which
avoids needing the Archimedean property of ℝ.
-/
import Real.Abs

namespace Analysis
open MyRat

namespace MyReal

/-- `x n → L`: eventually `x n` is within any positive rational `ε` of `L`. -/
def Tendsto (x : ℕ → MyReal) (L : MyReal) : Prop :=
  ∀ ε : MyRat, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n → |x n - L| < ofRat ε

/-- `IsPos (mk g hg)` is exactly an eventual positive lower bound on `g`. -/
theorem isPos_mk {g : ℕ → MyRat} {hg : IsCauchy g} :
    IsPos (mk g hg) ↔ ∃ q : MyRat, 0 < q ∧ ∃ N : ℕ, ∀ n : ℕ, N ≤ n → q ≤ g n := Iff.rfl

end MyReal
end Analysis
