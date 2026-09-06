# Choosing the variable for induction

The equations `add_zero` and `add_succ` inspect the second argument of a
sum. This is why many addition proofs induct on that argument: each branch
then presents a form the equations can use.

```lean
import Tutorial.twoaddtwo
open MyNat
example (n : ℕ) : n + succ 0 = succ n := by
  rewrite [add_succ, add_zero]
  rfl
```

For a variable `m` in place of `0`, you cannot simplify `0 + m` using
`add_zero`. Split into the zero and successor cases using induction. The
induction hypothesis is a proof about the predecessor, available only in
the successor branch.

The first exercise supplies a branch outline. Later ones ask you to choose
the induction variable yourself. Once associativity and commutativity have
been proved, some rearrangements need only rewriting.
