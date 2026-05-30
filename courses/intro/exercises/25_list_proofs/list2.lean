/- # List Proofs 2: Map and Reverse

  More list properties:
  - `List.length_map` : (l.map f).length = l.length
  - `List.map_id` : l.map id = l
  - `List.length_reverse` : l.reverse.length = l.length

  `simp` knows these too, but you can also prove them
  by induction for extra practice.

  TODO: Prove these by simp or induction.
-/

-- Mapping preserves length
theorem map_length (f : α → β) (l : List α) :
    (l.map f).length = l.length := by
  sorry

-- Mapping id does nothing
theorem map_id' (l : List α) : l.map id = l := by
  sorry

-- Reverse preserves length
theorem reverse_length (l : List α) : l.reverse.length = l.length := by
  sorry
