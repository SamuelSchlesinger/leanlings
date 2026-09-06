# Powers count repeated products

`pow_zero` says that a product of zero copies is `1`. `pow_succ` says that
one more copy multiplies the previous power by the base. These equations
also set the convention `0 ^ 0 = 1` in this development.

```lean
import Multiplication.mul_assoc
open MyNat
example (a b : ℕ) : a ^ 0 * b = b := by
  rewrite [pow_zero, one_mul]
  rfl
```

Induct on an exponent when `pow_succ` will expose a smaller power. A sum or
product inside an exponent must first be put into successor form using
the addition or multiplication equations.

In the square-expansion capstone, stop thinking recursively after you have
expanded the squares. The remaining task is polynomial rearrangement using
distributivity, associativity, and commutativity. Mark that change of strategy
with a new line in your proof.
