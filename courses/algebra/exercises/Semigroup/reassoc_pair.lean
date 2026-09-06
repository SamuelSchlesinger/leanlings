import Semigroup.reassoc_back

namespace Algebra

/- # Treat a product as one input

In `mul_assoc`, each input may itself be a product. Regard `a * b` as the first
input, `c` as the second, and `d` as the third. This makes the two sides of the
goal an instance of one associativity step. Being able to recognize composite
inputs saves unnecessary rewriting.
-/
theorem reassoc_pair {α : Type _} [Semigroup α] (a b c d : α) : a * b * (c * d) = a * b * c * d := by
  sorry

end Algebra
