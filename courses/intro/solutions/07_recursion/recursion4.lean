inductive Expr where
  | num (n : Nat)
  | add (a b : Expr)
  | mul (a b : Expr)
  deriving Repr

def eval : Expr → Nat
  | .num n   => n
  | .add a b => eval a + eval b
  | .mul a b => eval a * eval b

def countNums : Expr → Nat
  | .num _   => 1
  | .add a b => countNums a + countNums b
  | .mul a b => countNums a + countNums b
