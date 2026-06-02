-- Hidden correctness checks for this exercise (not shown to the learner).
private instance : BEq (Except String Int) where
  beq a b := match a, b with
    | .ok x, .ok y => x == y
    | .error x, .error y => x == y
    | _, _ => false

#guard validate 50 == .ok 50
#guard validate (-1) == .error "must be positive"
#guard validate 200 == .error "must be less than 100"

