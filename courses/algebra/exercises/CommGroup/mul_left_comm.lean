import CommGroup.mul_inv

namespace Algebra

/- # Swap two factors inside a product

Commutativity now permits changing the order as well as the grouping. To swap
`a` and `b`, first expose their product with associativity, commute that pair,
then restore the requested grouping. Keep `c` in place throughout.
-/
theorem mul_left_comm {G : Type _} [CommGroup G] (a b c : G) : a * (b * c) = b * (a * c) := by
  sorry

end Algebra
