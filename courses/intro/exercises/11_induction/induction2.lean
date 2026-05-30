/- # Induction 2: Induction on Lists

  Lists support induction too:

    induction l with
    | nil => ...          -- base case: empty list
    | cons h t ih => ...  -- inductive step: h :: t
                          -- ih is the hypothesis for t

  TODO: Prove that the length of two appended lists is the
        sum of their lengths.
-/

def myLength : List α → Nat
  | []     => 0
  | _ :: t => 1 + myLength t

-- Hint: Use `induction l1 with` to get two cases.
-- In the `nil` case, try `simp [myLength]`.
-- In the `cons` case, try `simp [myLength, ih, Nat.add_assoc]`.
theorem myLength_append (l1 l2 : List α) :
    myLength (l1 ++ l2) = myLength l1 + myLength l2 := by
  sorry
