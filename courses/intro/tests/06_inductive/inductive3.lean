-- Hidden correctness checks for this exercise (not shown to the learner).
#guard isNum (.num 5) == true
#guard isNum (.add (.num 1) (.num 2)) == false
#guard isNum (.mul (.num 1) (.num 2)) == false
#guard
  match sampleExpr with
  | .mul (.add (.num 2) (.num 3)) (.num 4) => true
  | _ => false
