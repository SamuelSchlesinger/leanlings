import CommGroup.inv_comm

namespace Algebra

/- # Rearrange the middle factors

Only `b` and `c` change places. Expose them as a neighboring pair, commute that
pair, then restore the target parentheses. This combines the two kinds of
bookkeeping: associativity changes grouping, commutativity changes order.
-/
theorem mul_mul_mul_comm {G : Type _} [CommGroup G] (a b c d : G) : a * b * (c * d) = a * c * (b * d) := by
  sorry

end Algebra
