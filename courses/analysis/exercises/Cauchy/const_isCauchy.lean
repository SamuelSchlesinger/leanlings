import Cauchy.Defs

namespace Analysis
open MyRat

/- # Cauchy world — sequences of rationals that "settle down"

`Cauchy.Defs` defines (and gives you a toolkit for):

  IsCauchy f       := ∀ ε > 0, ∃ N, ∀ m n ≥ N, |f m - f n| < ε
  CauchyEquiv f g  := ∀ ε > 0, ∃ N, ∀ n ≥ N, |f n - g n| < ε
  constSeq q       := the constant sequence `fun _ => q`

and analysis helpers on ℚ: `abs_add_le` (triangle), `abs_sub_le`,
`abs_sub_comm`, `add_lt_add`, `exists_half` (splits `ε` as `δ + δ`), and `calc`
works across `<`, `≤`, `=`.

THE SHAPE OF AN ε–N PROOF (learn it here): `intro ε hε`, choose an `N`, then for
`m n ≥ N` bound the quantity below `ε`. For a *constant* sequence the difference
is `q - q = 0`, so any `N` works (`0` is fine):

    intro ε hε
    refine ⟨0, fun m n _ _ => ?_⟩
    simp only [constSeq]
    rw [MyRat.sub_self, MyRat.abs_zero]
    exact hε
-/
theorem const_isCauchy (q : MyRat) : IsCauchy (constSeq q) := by
  sorry

end Analysis
