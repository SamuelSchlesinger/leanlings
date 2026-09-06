/- # Functions 3: Anonymous Functions

  Anonymous functions (lambdas) use the `fun` keyword:

    fun x => x + 1          -- a function that adds 1
    fun x y => x + y        -- a function that adds two numbers

  There's also a shorthand using `·` (typed with \cdot):

    (· + 1)                 -- same as fun x => x + 1
    (· * ·)                 -- same as fun x y => x * y

  TODO: Make `doubler` double its input, `isZero` test whether its
  input is zero, and `tripler` triple its input.
  The first two already begin with `fun n =>`: fill in their BODIES.
  For `tripler`, provide the whole function using the `·` shorthand.
-/

-- Use `fun n => ...` to write an anonymous function that doubles its input
def doubler : Nat → Nat := fun n => sorry

-- Note: Use `==` (not `=`) for boolean equality.
-- `==` returns Bool, while `=` creates a Prop (proposition).

-- Use `fun n => ...` to check if a number is zero
def isZero : Nat → Bool := fun n => sorry

-- Now use the `·` shorthand: (· + 1) means fun x => x + 1
def tripler : Nat → Nat := sorry
