/- # List Proofs 3: Proving Properties of Custom Functions

  When you define your own list functions, you prove properties
  about them using induction and `simp [your_function]`.

  TODO: Define the function and prove its properties.
-/

-- Custom append (to practice induction, not using ++)
def myAppend : List α → List α → List α
  | [], ys => ys
  | x :: xs, ys => x :: myAppend xs ys

-- myAppend with nil on the right is identity
theorem myAppend_nil (l : List α) : myAppend l [] = l := by
  sorry

-- myAppend is associative
theorem myAppend_assoc (a b c : List α) :
    myAppend (myAppend a b) c = myAppend a (myAppend b c) := by
  sorry

-- myAppend agrees with ++
theorem myAppend_eq_append (a b : List α) : myAppend a b = a ++ b := by
  sorry
