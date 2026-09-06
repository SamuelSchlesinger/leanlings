/- # Proving Code 1: Your First Proofs

  In Lean, you can *prove* things about your code.
  A `theorem` states a fact, and you must provide a proof.

  A theorem has the shape `theorem name : statement := proof`.
  For an equality whose sides reduce by definition to the same
  expression, `rfl` ("reflexivity") supplies a proof. For example:

    theorem three_plus_one : 3 + 1 = 4 := rfl

  Lean checks that this proof has the stated type. This is different
  from `#eval`, which asks Lean to run code and display a result.
  `rfl` does not prove every true equation: some equations need
  reasoning about variables, which we will learn next.

  This is the bridge between programming and proving:
  functions you write become things you can reason about.

  TODO: For each theorem, first work out what both sides reduce to.
  Then replace `sorry` with `rfl` and check your prediction.
  Keep the function definitions and theorem statements as written.
-/

def double (n : Nat) : Nat := n + n

def isEven (n : Nat) : Bool := n % 2 == 0

-- Lean computes: double 3 = 3 + 3 = 6
theorem double_3 : double 3 = 6 := sorry

-- Lean computes: double 0 = 0 + 0 = 0
theorem double_0 : double 0 = 0 := sorry

-- Lean computes: isEven 4 = (4 % 2 == 0) = (0 == 0) = true
theorem four_is_even : isEven 4 = true := sorry

-- Both sides compute to 4, so they're equal
theorem double_2_is_add : double 2 = 2 + 2 := sorry
