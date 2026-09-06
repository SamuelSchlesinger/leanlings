import Magma.bool_comm

namespace Algebra

/- # Check the grouping on a small example

Associativity compares two ways to group three inputs while keeping their
order. Boolean conjunction has only eight triples to check. Prove the universal
statement, then compare it with the previous exercise: which law changes the
order, and which changes only the parentheses?
-/
theorem bool_assoc : ∀ a b c : Bool, a * b * c = a * (b * c) := by
  sorry

end Algebra
