theorem append_nil' (l : List α) : l ++ [] = l := by
  simp

theorem append_assoc' (a b c : List α) : (a ++ b) ++ c = a ++ (b ++ c) := by
  simp [List.append_assoc]

theorem length_append' (a b : List α) : (a ++ b).length = a.length + b.length := by
  simp
