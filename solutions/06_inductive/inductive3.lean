inductive Expr where
  | num (n : Nat)
  | add (a b : Expr)
  | mul (a b : Expr)
  deriving Repr

def isNum : Expr → Bool
  | .num _ => true
  | _      => false

def sampleExpr : Expr :=
  .mul (.add (.num 2) (.num 3)) (.num 4)
