import Complete.approx

namespace Analysis
open MyReal

theorem MyReal.approx_isCauchy {x : ℕ → MyReal} {q : ℕ → MyRat}
    (hx : IsCauchySeq x)
    (hqspec : ∀ k, |x k - ofRat (q k)| < ofRat (tolSeq k)) :
    IsCauchy q := by
  intro ε hε
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hε
  obtain ⟨μ, hμ, hμμ⟩ := MyRat.exists_half hη
  obtain ⟨K0, hK0⟩ := tolSeq_lt hμ
  obtain ⟨K1, hK1⟩ := hx η hη
  refine ⟨Nat.max K0 K1, fun m n hm hn => ?_⟩
  have hAm : |x m - ofRat (q m)| < ofRat μ :=
    MyReal.lt_trans (hqspec m) (ofRat_lt (hK0 m (Nat.le_trans (Nat.le_max_left _ _) hm)))
  have hAn : |x n - ofRat (q n)| < ofRat μ :=
    MyReal.lt_trans (hqspec n) (ofRat_lt (hK0 n (Nat.le_trans (Nat.le_max_left _ _) hn)))
  have hB : |x m - x n| < ofRat η :=
    hK1 m n (Nat.le_trans (Nat.le_max_right _ _) hm) (Nat.le_trans (Nat.le_max_right _ _) hn)
  rw [← ofRat_lt_iff, ofRat_abs, ofRat_sub]
  calc |ofRat (q m) - ofRat (q n)|
      ≤ |ofRat (q m) - x m| + |x m - ofRat (q n)| := abs_sub_le _ _ _
    _ ≤ |ofRat (q m) - x m| + (|x m - x n| + |x n - ofRat (q n)|) :=
        add_le_add_left _ (abs_sub_le _ _ _)
    _ < ofRat μ + (ofRat η + ofRat μ) :=
        MyReal.add_lt_add (by rw [abs_sub_comm]; exact hAm) (MyReal.add_lt_add hB hAn)
    _ = ofRat ε := by
        rw [← ofRat_add, ← ofRat_add]; congr 1
        rw [MyRat.add_comm η μ, ← MyRat.add_assoc, hμμ, hηη]

end Analysis
