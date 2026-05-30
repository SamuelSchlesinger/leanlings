/- # Control Flow 2: Nested Conditionals

  You can chain `if/then/else`:

    if c1 then a
    else if c2 then b
    else c

  TODO: Implement `classify` that returns:
    "positive" if n > 0
    "zero"     if n == 0
    "negative" if n < 0
-/

def classify (n : Int) : String := sorry

-- Don't change below this line!
#guard classify 5 == "positive"
#guard classify 0 == "zero"
#guard classify (-3) == "negative"
