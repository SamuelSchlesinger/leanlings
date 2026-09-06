# Multiplication uses addition

The new equations are `a * 0 = 0` and `a * succ b = a * b + a`.
The second describes one additional copy of `a`. As with addition, it
inspects the right argument.

```lean
import Addition.add_right_comm
open MyNat
example (a : ℕ) : a * 0 + a = a := by
  rewrite [mul_zero, zero_add]
  rfl
```

To prove a multiplication law by induction, use `mul_succ` to expose a
smaller product, apply the induction hypothesis, and then solve the
remaining addition problem. The addition theorems are your toolkit now.

Distributivity is a useful checkpoint: can you explain why multiplying a
sum makes two products? Associativity then combines this explanation with
induction. Keep the roles of the two operations visible in the intermediate
goals.
