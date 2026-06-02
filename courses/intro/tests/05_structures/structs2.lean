-- Hidden correctness checks for this exercise (not shown to the learner).
#guard fullName { firstName := "Jane", lastName := "Doe", age := 25 } == "Jane Doe"
#guard isAdult { firstName := "A", lastName := "B", age := 18 } == true
#guard isAdult { firstName := "A", lastName := "B", age := 17 } == false
#guard birthday { firstName := "A", lastName := "B", age := 25 } == { firstName := "A", lastName := "B", age := 26 }

