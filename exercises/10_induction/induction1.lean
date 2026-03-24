/- # Induction 1: Induction on Nat

  To prove properties for all natural numbers, use induction:

    induction n with
    | zero => ...        -- base case: prove for 0
    | succ n ih => ...   -- inductive step: prove for n+1
                         -- `ih` is the induction hypothesis for n

  `myAdd` below recurses on the second argument:
    myAdd n 0     = n
    myAdd n (m+1) = (myAdd n m) + 1

  So `myAdd n 0 = n` is true by definition (first equation),
  but `myAdd 0 n = n` is NOT — it requires induction on `n`.

  TODO: Prove these theorems. The first is definitional (try `rfl`).
        The second genuinely requires `induction`.
-/

def myAdd : Nat → Nat → Nat
  | n, 0     => n
  | n, m + 1 => (myAdd n m) + 1

-- This is true by definition — `rfl` suffices
theorem myAdd_zero (n : Nat) : myAdd n 0 = n := by
  sorry

-- This requires induction on `n`
theorem myAdd_zero_left (n : Nat) : myAdd 0 n = n := by
  sorry
