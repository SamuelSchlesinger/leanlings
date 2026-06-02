def classify (n : Int) : String :=
  if n > 0 then "positive"
  else if n == 0 then "zero"
  else "negative"
