# Building a theory one theorem at a time

This course introduces mathematical proof through natural numbers. Start with
the tutorial even if you already know the arithmetic: the point is to express
why each statement follows from the available facts.

The type `MyNat`, written `ℕ`, has constructors `0` and `succ`. Its arithmetic
operations are opaque and characterized by six stated axioms: the zero and
successor equations for addition, multiplication, and powers. Later theorems
are proved from those equations. This differs from evaluating arithmetic on
Lean's built-in `Nat`.

Imports supply the previous levels' reference theorems. You can therefore
work on one level at a time without a mistake in an earlier file breaking
the whole course. Names and theorem statements identify the task; replace
the `sorry` with your proof.

Read the assumptions above the goal before choosing a tactic. After each
tactic, compare the new goal with the previous one. When you use a hint, try
to explain why its first step helps before typing the rest of the proof.

This port uses core Lean's `rw`, which may close a reflexive equality
automatically. Reference answers often use `rewrite` followed by `rfl` to
make those two steps visible. If Lean says there are no goals left, the last
tactic may already have finished your proof.

The course uses standard Lean tactics. `refine ⟨witness, ?_⟩` starts an
existence proof; `obtain ⟨witness, evidence⟩ := h` opens one. `rcases h with
hleft | hright` creates two branches from a disjunction. Applying an
implication is ordinary function application: from `step : P → Q` and
`hp : P`, the term `step hp` proves `Q`.

`MyNat.rec'` is the induction principle for this course's natural numbers.
The surrounding `induction ... using ... with` syntax is standard Lean.
The final world defines one small tactic, `simp_add`, to show how a proof
strategy you understand can be packaged as automation.

Adapted from the Natural Number Game. See `NOTICE` and `LICENSE` in this
course for the original authors, license, and changes made in this port.

## A route through the worlds

| Worlds | Question to answer before moving on |
| --- | --- |
| Tutorial | Which subexpression does my rewrite change? |
| Addition | Why does induction on the right input expose the addition equations? |
| Multiplication, Power | Where does the induction step become a theorem from an earlier world? |
| Implication | Am I supplying evidence, transforming it, or assuming it for a contradiction? |
| AdvAddition | Why is constructor injectivity enough to cancel addition? |
| LessOrEqual | What is the witness for this inequality? |
| AdvMultiplication | Where is the nonzero assumption used, and why must another variable stay general? |
| Algorithm | What proof rules does the automation repeatedly apply? |

You do not need to finish the programming parts of Intro before starting this
course. If the distinction between a proposition and its proof is unfamiliar,
review Intro's propositions and tactics units alongside Implication world.

## When a tactic gets stuck

- **The rewrite found no match:** write down the left side of the lemma and
  look for that exact grouping in the goal. Try explicit arguments before
  adding more rewrite rules.
- **There are no goals left:** `rw` may already have closed a reflexive goal.
  Remove the next tactic, or use `rewrite` to inspect the intermediate equality.
- **The induction hypothesis does not apply:** compare its variables and
  hypotheses with the current goal. Later cancellation needs `generalizing`
  because a recursive step changes the other factor too.
- **Arithmetic automation does nothing:** `ℕ` here is `MyNat`; its arithmetic
  is opaque. Use the six arithmetic equations and the theorems you have built.

After each world, retry one proof with the solution hidden. First predict the
base case, witness, or intermediate equation on paper. A successful check is
most useful when you can also explain why those choices worked.
