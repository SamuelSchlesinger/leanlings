inductive Tree (α : Type) where
  | leaf : Tree α
  | node (left : Tree α) (value : α) (right : Tree α) : Tree α
  deriving Repr

def Tree.size : Tree α → Nat
  | .leaf => 0
  | .node l _ r => 1 + l.size + r.size

def Tree.toList : Tree α → List α
  | .leaf => []
  | .node l v r => l.toList ++ [v] ++ r.toList

theorem Tree.size_leaf : (Tree.leaf : Tree α).size = 0 := by
  rfl

theorem Tree.toList_leaf : (Tree.leaf : Tree α).toList = [] := by
  rfl

def sampleTree : Tree Nat :=
  .node (.node .leaf 1 .leaf) 2 (.node .leaf 3 .leaf)

theorem sample_size : sampleTree.size = 3 := by
  rfl
