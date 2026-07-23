-- Hidden correctness checks for this exercise (not shown to the learner).
#guard myContains 3 [1, 2, 3] == true
#guard myContains 4 [1, 2, 3] == false
#guard myContains 1 ([] : List Nat) == false
#guard myDedup [1, 2, 1, 3, 2] == [1, 3, 2]
#guard myDedup [1, 2, 3] == [1, 2, 3]
#guard myDedup ([] : List Nat) == []
