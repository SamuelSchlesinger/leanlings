# Evidence can be an input

A proof of `P → Q` takes evidence of `P` and returns evidence of `Q`.
`intro hp` names the input when the goal is an implication. `exact` supplies
a proof of the current goal.

```lean
example (P Q : Prop) (step : P → Q) : P → Q := by
  intro hp
  exact step hp
```

You can also work backward: `apply step` changes a goal `Q` into `P`.
These are two views of the same proof. Try both on a small example and
compare the intermediate goals.

Negation `¬ P` is `P → False`; inequality is negated equality. A proof of
`x ≠ y` therefore starts by assuming `x = y` and deriving a contradiction.
The constructor facts about `0` and `succ` give you contradictions for the
numeral exercises.
