def myLength : List α → Nat
  | []     => 0
  | _ :: t => 1 + myLength t

theorem myLength_append (l1 l2 : List α) :
    myLength (l1 ++ l2) = myLength l1 + myLength l2 := by
  induction l1 with
  | nil => simp [myLength]
  | cons h t ih => simp [myLength, ih, Nat.add_assoc]
