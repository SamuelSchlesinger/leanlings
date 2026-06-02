-- Hidden correctness checks for this exercise (not shown to the learner).
#guard countWhere (· > 3) [1, 2, 3, 4, 5] == 2
#guard countWhere (· == 0) [0, 1, 0, 2] == 2
#guard countWhere (· > 0) ([] : List Nat) == 0
#guard listMax [1, 5, 3, 9, 2] == 9
#guard listMax ([] : List Nat) == 0

