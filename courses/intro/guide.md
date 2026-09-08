# Learning to program and prove in Lean

Start here if Lean is new to you. The course assumes no Lean experience.
The programming lessons introduce functions and data; the proof lessons
show how to state and justify properties of them. Each exercise's opening
comment is its lesson. Read it before filling the holes.

## Set up a useful feedback loop

Run commands from the Leanlings directory after `lake build`. Open that same
directory in a Lean-enabled editor so it finds the pinned toolchain and
course libraries. In VS Code, the Lean 4 extension provides an Infoview:
place the cursor after a tactic to see the assumptions and remaining goals.
The terminal checker reports completed proofs and errors; it does not show
each intermediate proof state.

1. Read the task and predict a result or a first proof step.
2. Change one definition or proof, save, and run `lake exe leanlings run`.
3. Read the first error. A remaining `sorry` is expected while other parts
   are unfinished; it is not an instruction to change a theorem's statement.
4. When the exercise passes, run `lake exe leanlings next`. In `watch` mode,
   saving triggers the check and passing advances automatically.

Use `#check expression` to inspect a type and `#eval expression` to compute
a value. In a terminal, `lake env lean path/to/exercise.lean` also displays
their output. Remove temporary `#eval` commands from IO exercises before
checking their exact printed output.

Use `hint` for a next step and `solution` for a reference answer. After a
reveal, close the answer and reconstruct the argument with your own names.
Explain why it works before moving on. The checker accepts alternative
complete proofs; practicing the requested technique is part of the lesson.
`reset` discards your edits to the selected exercise.

## Follow the course in order

| Units | What you learn | Check before moving on |
| --- | --- | --- |
| 00-02: Intro, basics, definitions | Values, types, errors, functions, local names | Explain the different roles of `:`, `:=`, and `=`. |
| 03-04: Functions and control flow | Lambdas, list transformations, conditionals, `Option` | Trace a small input through your function, including an empty or missing case. |
| 05-07: Structures, inductive types, recursion | Records, alternatives, recursive data | Point to the smaller input of each recursive call. |
| 08-10: Proving code, propositions, tactics | Equality, evidence, implications, rewriting | Say what is assumed and what remains to prove after each tactic. |
| 11-12: Induction and type classes | Recursive proofs and overloaded operations | Distinguish an induction hypothesis from an instance Lean finds for you. |
| 13: Library catalog quiz | Combine data, functions, and proofs | Work through one numbered part at a time; this is a larger project. |
| 14-18: Do notation, IO, implicit arguments, arrays, namespaces | Sequencing and organizing programs | Explain what `:=` binds and what `<-` binds in a `do` block. |
| 19: Practical quiz | Reuse the programming patterns | Test zero, empty, success, and failure cases where applicable. |
| 20-23: Exists, cases/have, calc, classical logic | Witnesses and structured arguments | Distinguish choosing a witness from extracting one, and `cases` from induction. |
| 24-25: Nat and list proofs | Library reuse and proofs of custom functions | Explain why `simp` needs your function's definition and induction hypothesis. |
| 26: Tree capstone | Recursive programs and their specifications | Relate the two induction hypotheses to the two recursive subtrees. |

The course returns to programming after the first quiz, then to proofs at
unit 20. That is intentional: each return applies familiar ideas to a new
kind of problem. A quiz contains several tasks and will take longer than a
single warm-up exercise.

## Read the notation by its role

`def result : Nat := 3` gives a value a name. In `theorem h : P := proof`,
`P` is a proposition and the right side must supply evidence for it.
`P → Q` is a function type whose inputs and outputs are proofs; `Nat → Nat`
is a function type whose inputs and outputs are numbers.

| Notation | Meaning | ASCII spelling or editor input |
| --- | --- | --- |
| `→` | Function or implication | `->` |
| `←` | Bind a computation, or reverse a rewrite | `<-` |
| `≤`, `≥`, `≠` | Comparisons | `<=`, `>=`; `\ne` for `≠` in a Lean editor |
| `∧`, `∨`, `¬` | And, or, not | `\and`, `\or`, `\not` in a Lean editor |
| `∀`, `∃` | For every, there exists | `\forall`, `\exists` in a Lean editor |
| `⟨a, b⟩` | Construct a pair of fields or proofs | `\langle`, `\rangle` |
| `·` | Function shorthand or a proof branch | `\cdot` |
| `⊢` | The following proposition is the goal | Displayed by Lean; do not type it as a tactic |

`==` computes a Boolean comparison; `=` states a proposition. The function
named `decide` converts a decidable proposition to `Bool`; the tactic
`by decide` proves a proposition by evaluating its decision procedure.

## When a proof gets stuck

- **`rfl` fails:** the sides do not reduce to the same expression. Look for
  a hypothesis or theorem relating them.
- **A rewrite finds no match:** check its direction, parentheses, and
  arguments. `rw [h] at h2` rewrites a hypothesis instead of the goal.
- **There are no goals left:** the previous tactic finished. Delete the
  extra tactic; `rw` and `simp` can both close goals.
- **Arithmetic automation fails:** `omega` handles linear arithmetic on
  `Nat` and `Int`. A product of two variables may need a distributive law
  or another argument first.
- **The code compiles but a check fails:** compare the named requirement
  with a small `#eval` example. Keep the supplied names and theorem types.

After the tree capstone, NNG offers practice developing a theory by induction;
Algebra applies proof techniques to abstract structures. Analysis is an
advanced construction course and also assumes comfort with inequalities and
epsilon arguments.
