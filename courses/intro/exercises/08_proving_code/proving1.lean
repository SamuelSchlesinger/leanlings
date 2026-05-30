/- # Proving Code 1: Your First Proofs

  In Lean, you can *prove* things about your code.
  A `theorem` states a fact, and you must provide a proof.

  When both sides of an equation compute to the same value,
  `rfl` ("reflexivity") is a proof. Lean evaluates both
  sides and checks they match — no cleverness needed.

  This is the bridge between programming and proving:
  functions you write become things you can reason about.

  TODO: Replace each `sorry` with `rfl`.
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
