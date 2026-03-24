/- # Propositions 2: And / Or

  Logical connectives in Lean:

  • `A ∧ B` (And): proved by `⟨proof_a, proof_b⟩` or `And.intro ha hb`
  • `A ∨ B` (Or):  proved by `Or.inl proof_a` (left) or `Or.inr proof_b` (right)

  You can type ∧ as \and and ∨ as \or.

  TODO: Provide proofs for each theorem.
-/

-- To prove A ∧ B, prove both A and B
theorem and_example : 1 + 1 = 2 ∧ 2 + 2 = 4 := sorry

-- To prove A ∨ B, prove either A or B
theorem or_example : 1 + 1 = 2 ∨ 1 + 1 = 3 := sorry

-- You can use And.intro and Or.inl/Or.inr explicitly
theorem and_or : (True ∧ True) ∨ False := sorry
