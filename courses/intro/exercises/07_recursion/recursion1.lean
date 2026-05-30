/- # Recursion 1: Natural Number Recursion

  Lean supports recursive functions. For Nat recursion,
  match on zero and successor:

    def countdown : Nat → List Nat
      | 0     => [0]
      | n + 1 => (n + 1) :: countdown n

  Lean checks that recursion is structurally decreasing
  (the argument gets smaller in each recursive call).

  TODO: Implement `factorial`.
        factorial 0 = 1
        factorial 5 = 120
-/

def factorial : Nat → Nat := sorry

-- Don't change below this line!
#guard factorial 0 == 1
#guard factorial 5 == 120
