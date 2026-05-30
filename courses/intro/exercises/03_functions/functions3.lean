/- # Functions 3: Anonymous Functions

  Anonymous functions (lambdas) use the `fun` keyword:

    fun x => x + 1          -- a function that adds 1
    fun x y => x + y        -- a function that adds two numbers

  There's also a shorthand using `·` (typed with \cdot):

    (· + 1)                 -- same as fun x => x + 1
    (· * ·)                 -- same as fun x y => x * y

  TODO: Replace `sorry` with anonymous functions.
-/

-- Use `fun n => ...` to write an anonymous function that doubles its input
def doubler : Nat → Nat := fun n => sorry

-- Note: Use `==` (not `=`) for boolean equality.
-- `==` returns Bool, while `=` creates a Prop (proposition).

-- Use `fun n => ...` to check if a number is zero
def isZero : Nat → Bool := fun n => sorry

-- Now use the `·` shorthand: (· + 1) means fun x => x + 1
def tripler : Nat → Nat := sorry

-- Don't change below this line!
#guard doubler 5 == 10
#guard doubler 0 == 0
#guard isZero 0 == true
#guard isZero 5 == false
#guard tripler 3 == 9
#guard tripler 0 == 0
