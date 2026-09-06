import Complete.approx_isCauchy

namespace Analysis
open MyReal

theorem MyReal.tendsto_of_approx {x : ℕ → MyReal} {q : ℕ → MyRat} {L : MyReal}
    (hqspec : ∀ k, |x k - ofRat (q k)| < ofRat (tolSeq k))
    (hq : Tendsto (fun k => ofRat (q k)) L) : Converges x L := by
  intro ε hε
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hε
  obtain ⟨K0, hK0⟩ := tolSeq_lt hη
  obtain ⟨K1, hK1⟩ := hq η hη
  refine ⟨Nat.max K0 K1, fun k hk => ?_⟩
  show |x k - L| < ofRat ε
  calc |x k - L|
      ≤ |x k - ofRat (q k)| + |ofRat (q k) - L| := abs_sub_le _ _ _
    _ < ofRat η + ofRat η :=
        MyReal.add_lt_add
          (MyReal.lt_trans (hqspec k) (ofRat_lt (hK0 k (Nat.le_trans (Nat.le_max_left _ _) hk))))
          (hK1 k (Nat.le_trans (Nat.le_max_right _ _) hk))
    _ = ofRat ε := by rw [← ofRat_add, hηη]

end Analysis
