def reverse (l : List α) : List α :=
  go l []
where
  go : List α → List α → List α
    | [], acc     => acc
    | h :: t, acc => go t (h :: acc)
