/- # Do Notation 2: Error Handling with Except

  `Except ε α` is like `Option` but carries an error message:
  • `Except.ok value` — success
  • `Except.error msg` — failure with a message

  `do` notation works the same way — `←` extracts from `ok`,
  and short-circuits on `error`.

  TODO: Implement the validation functions.
-/

def checkPositive (n : Int) : Except String Int :=
  if n > 0 then .ok n else .error "must be positive"

def checkSmall (n : Int) : Except String Int :=
  if n < 100 then .ok n else .error "must be less than 100"

-- Validate that a number is both positive and small
def validate (n : Int) : Except String Int := sorry

-- Don't change below this line!
#guard validate 50 == .ok 50
#guard validate (-1) == .error "must be positive"
#guard validate 200 == .error "must be less than 100"
