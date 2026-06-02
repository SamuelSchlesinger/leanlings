def myAppend : List α → List α → List α
  | [], ys => ys
  | x :: xs, ys => x :: myAppend xs ys

theorem myAppend_nil (l : List α) : myAppend l [] = l := by
  induction l with
  | nil => simp [myAppend]
  | cons h t ih => simp [myAppend, ih]

theorem myAppend_assoc (a b c : List α) :
    myAppend (myAppend a b) c = myAppend a (myAppend b c) := by
  induction a with
  | nil => simp [myAppend]
  | cons h t ih => simp [myAppend, ih]

theorem myAppend_eq_append (a b : List α) : myAppend a b = a ++ b := by
  induction a with
  | nil => simp [myAppend]
  | cons h t ih => simp [myAppend, ih]
