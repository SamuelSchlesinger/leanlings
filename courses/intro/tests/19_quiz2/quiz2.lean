-- Hidden correctness checks for this exercise (not shown to the learner).
#guard safeDivTwice 100 5 4 == some 5
#guard safeDivTwice 100 0 4 == none
#guard safeDivTwice 100 5 0 == none
#guard sumOfSquares 0 == 0
#guard sumOfSquares 1 == 1
#guard sumOfSquares 3 == 14
#guard countOccurrences 3 [1, 3, 2, 3, 3] == 3
#guard countOccurrences "a" ["b", "a", "c"] == 1
#guard countOccurrences 7 ([] : List Nat) == 0

