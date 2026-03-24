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
  this automatically — if your recursion isn't structural, it
  will reject the definition.

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

-- Don't change below this line!
#guard eval (.num 7) == 7
#guard eval (.add (.num 2) (.num 3)) == 5
#guard eval (.mul (.num 4) (.num 5)) == 20
#guard eval (.add (.mul (.num 2) (.num 3)) (.num 1)) == 7
#guard countNums (.num 5) == 1
#guard countNums (.add (.num 1) (.num 2)) == 2
#guard countNums (.mul (.add (.num 1) (.num 2)) (.num 3)) == 3
