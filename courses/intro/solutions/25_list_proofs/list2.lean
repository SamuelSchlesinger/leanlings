theorem map_length (f : α → β) (l : List α) :
    (l.map f).length = l.length := by
  simp

theorem map_id' (l : List α) : l.map id = l := by
  simp

theorem reverse_length (l : List α) : l.reverse.length = l.length := by
  simp
