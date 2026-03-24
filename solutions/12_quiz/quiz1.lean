structure Point where
  x : Nat
  y : Nat
  deriving Repr, BEq

def manhattan (p q : Point) : Nat :=
  (if p.x >= q.x then p.x - q.x else q.x - p.x) +
  (if p.y >= q.y then p.y - q.y else q.y - p.y)

def countIf (pred : α → Bool) : List α → Nat
  | []     => 0
  | h :: t => (if pred h then 1 else 0) + countIf pred t

theorem manhattan_self (p : Point) : manhattan p p = 0 := by
  simp [manhattan]
