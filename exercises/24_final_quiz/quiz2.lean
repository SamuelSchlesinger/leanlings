/- # Final Quiz: The Complete Picture

  This capstone exercise tests everything you've learned:
  structures, functions, recursion, proofs, tactics, induction,
  type classes, and do notation.

  TODO: Complete all definitions and proofs.
-/

-- 1. Define a type for binary trees
inductive Tree (α : Type) where
  | leaf : Tree α
  | node (left : Tree α) (value : α) (right : Tree α) : Tree α
  deriving Repr

-- 2. Count the nodes in a tree (recursive)
def Tree.size : Tree α → Nat := sorry

-- 3. Collect all values into a list (in-order traversal)
def Tree.toList : Tree α → List α := sorry

-- 4. Prove: a leaf has size 0
theorem Tree.size_leaf : (Tree.leaf : Tree α).size = 0 := by
  sorry

-- 5. Prove: toList of a leaf is empty
theorem Tree.toList_leaf : (Tree.leaf : Tree α).toList = [] := by
  sorry

-- 6. Build a sample tree and test it
def sampleTree : Tree Nat :=
  .node (.node .leaf 1 .leaf) 2 (.node .leaf 3 .leaf)

-- 7. Prove the size of the sample tree
theorem sample_size : sampleTree.size = 3 := by
  sorry
