/- # Recursion 4: Recursion on Custom Types

  So far we've recursed over Nat and List — types from the
  standard library. But you can recurse over any inductive
  type you define!

  Recall the expression type from the inductive exercises:

    inductive Expr where
      | num (n : Nat)
      | add (a b : Expr)
      | mul (a b : Expr)

  A recursive function follows the same pattern — match on
  each constructor and recurse on sub-expressions:

    def depth : Expr → Nat
      | .num _   => 0
      | .add a b => 1 + max (depth a) (depth b)
      | .mul a b => 1 + max (depth a) (depth b)

  This is called **structural recursion**: every recursive call
  is on a structurally smaller part of the input. Lean verifies
  this automatically for the functions in this lesson. Other recursive
  definitions can be accepted with a different termination argument;
  we will stay with structural recursion here.

  TODO: Implement `eval` and `countNums`.
-/

inductive Expr where
  | num (n : Nat)
  | add (a b : Expr)
  | mul (a b : Expr)
  deriving Repr

-- Evaluate the expression tree to a Nat
def eval : Expr → Nat := sorry

-- Count how many `num` leaves are in the expression
def countNums : Expr → Nat := sorry
