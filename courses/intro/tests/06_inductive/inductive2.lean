-- Hidden correctness checks for this exercise (not shown to the learner).
#guard getValueOr (.ok 42) 0 == 42
#guard getValueOr (.error "oops") 99 == 99
#guard isOk (.ok 5) == true
#guard isOk (.error "nope") == false

