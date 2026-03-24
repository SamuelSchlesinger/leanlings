def checkPositive (n : Int) : Except String Int :=
  if n > 0 then .ok n else .error "must be positive"

def checkSmall (n : Int) : Except String Int :=
  if n < 100 then .ok n else .error "must be less than 100"

def validate (n : Int) : Except String Int := do
  let x ← checkPositive n
  let y ← checkSmall x
  return y
