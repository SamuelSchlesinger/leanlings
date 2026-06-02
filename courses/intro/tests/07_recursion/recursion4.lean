-- Hidden correctness checks for this exercise (not shown to the learner).
#guard eval (.num 7) == 7
#guard eval (.add (.num 2) (.num 3)) == 5
#guard eval (.mul (.num 4) (.num 5)) == 20
#guard eval (.add (.mul (.num 2) (.num 3)) (.num 1)) == 7
#guard countNums (.num 5) == 1
#guard countNums (.add (.num 1) (.num 2)) == 2
#guard countNums (.mul (.add (.num 1) (.num 2)) (.num 3)) == 3

