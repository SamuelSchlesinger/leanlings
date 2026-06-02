-- Hidden correctness checks for this exercise (not shown to the learner).
#guard myElem 3 [1, 2, 3] == true
#guard myElem 4 [1, 2, 3] == false
#guard myElem 1 ([] : List Nat) == false
#guard myRemoveAll 2 [1, 2, 3, 2, 4] == [1, 3, 4]
#guard myRemoveAll 5 [1, 2, 3] == [1, 2, 3]

