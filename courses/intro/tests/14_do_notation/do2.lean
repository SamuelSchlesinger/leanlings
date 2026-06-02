-- Hidden correctness checks for this exercise (not shown to the learner).
-- `Except` has no `BEq` instance in core Lean; derive one so the guards can
-- use `==` (fix from #4 by @pete-murphy).
deriving instance BEq for Except

#guard validate 50 == .ok 50
#guard validate (-1) == .error "must be positive"
#guard validate 200 == .error "must be less than 100"

