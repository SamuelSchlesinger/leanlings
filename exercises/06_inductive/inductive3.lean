/- # Inductive Types 3: Recursive Types

  Inductive types can be recursive — a constructor can
  refer to the type being defined:

    inductive Expr where
      | num (n : Nat)
      | add (a b : Expr)
      | mul (a b : Expr)

  `add` and `mul` each contain two sub-expressions of type `Expr`.

  You can still pattern match on the top-level constructor
  without recursion:

    def isAdd : Expr → Bool
      | .add _ _ => true
      | _        => false

  TODO: Implement `isNum` and construct a sample expression.
-/

inductive Expr where
  | num (n : Nat)
  | add (a b : Expr)
  | mul (a b : Expr)
  deriving Repr

-- Return true if the expression is a literal number
def isNum : Expr → Bool := sorry

-- Construct the expression representing (2 + 3) * 4
def sampleExpr : Expr := sorry

-- Don't change below this line!
#guard isNum (.num 5) == true
#guard isNum (.add (.num 1) (.num 2)) == false
