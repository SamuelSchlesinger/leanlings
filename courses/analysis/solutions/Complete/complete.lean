import Complete.approx
namespace Analysis
open MyReal
theorem MyReal.complete : IsComplete MyReal := by
  intro x hx
  let q : ℕ → MyRat := fun k => Classical.choose (MyReal.approx (x k) (tolSeq_pos k))
  have hqspec : ∀ k, |x k - ofRat (q k)| < ofRat (tolSeq k) :=
    fun k => Classical.choose_spec (MyReal.approx (x k) (tolSeq_pos k))
  have hqcauchy : IsCauchy q := by
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
  refine ⟨mk q hqcauchy, ?_⟩
  intro ε hε
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hε
  obtain ⟨K0, hK0⟩ := tolSeq_lt hη
  obtain ⟨K1, hK1⟩ := cauchy_seq_converges q hqcauchy η hη
  refine ⟨Nat.max K0 K1, fun k hk => ?_⟩
  show |x k - mk q hqcauchy| < ofRat ε
  calc |x k - mk q hqcauchy|
      ≤ |x k - ofRat (q k)| + |ofRat (q k) - mk q hqcauchy| := abs_sub_le _ _ _
    _ < ofRat η + ofRat η :=
        MyReal.add_lt_add
          (MyReal.lt_trans (hqspec k) (ofRat_lt (hK0 k (Nat.le_trans (Nat.le_max_left _ _) hk))))
          (hK1 k (Nat.le_trans (Nat.le_max_right _ _) hk))
    _ = ofRat ε := by rw [← ofRat_add, hηη]
end Analysis
