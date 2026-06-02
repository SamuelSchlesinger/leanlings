-- Hidden correctness checks for this exercise (not shown to the learner).
#guard myContains 3 [1, 2, 3] == true
#guard myContains 4 [1, 2, 3] == false
#guard myContains 1 ([] : List Nat) == false

