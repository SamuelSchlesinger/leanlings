-- Hidden correctness checks for this exercise (not shown to the learner).
-- =============================================
#guard sampleTree.size == 3
#guard (Tree.leaf : Tree Nat).size == 0
#guard sampleTree.toList == [1, 2, 3]
#guard sampleTree.mirror.size == 3
#guard sampleTree.mirror.toList == [3, 2, 1]
#guard sampleTree.mirror.mirror == sampleTree
#guard sampleTree.depth == 2
#guard (Tree.leaf : Tree Nat).depth == 0
#guard sampleTree.toList.length == sampleTree.size

