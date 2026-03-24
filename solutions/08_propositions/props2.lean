theorem and_example : 1 + 1 = 2 ∧ 2 + 2 = 4 := ⟨rfl, rfl⟩

theorem or_example : 1 + 1 = 2 ∨ 1 + 1 = 3 := Or.inl rfl

theorem and_or : (True ∧ True) ∨ False := Or.inl ⟨trivial, trivial⟩
