theorem arith1 : 2 + 3 = 5 := by omega

theorem arith2 (n : Nat) : n + 0 = n := by omega

theorem simp_example (l : List Nat) : l ++ [] = l := by simp

theorem decide_example : 2 < 5 := by decide
