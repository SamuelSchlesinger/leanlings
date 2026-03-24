/- # Functions 3: Anonymous Functions

  Anonymous functions (lambdas) use the `fun` keyword:

    fun x => x + 1          -- a function that adds 1
    fun x y => x + y        -- a function that adds two numbers

  There's also a shorthand using `·` (typed with \cdot):

    (· + 1)                 -- same as fun x => x + 1
    (· * ·)                 -- same as fun x y => x * y

  TODO: Replace `sorry` with anonymous functions.
-/

-- An anonymous function that doubles its input
def doubler : Nat → Nat := sorry

-- Note: Use `==` (not `=`) for boolean equality.
-- `==` returns Bool, while `=` creates a Prop (proposition).

-- An anonymous function that checks if a number is zero
def isZero : Nat → Bool := sorry
