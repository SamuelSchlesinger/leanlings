# Leanlings

Learn Lean 4 by fixing 70 small exercises, one at a time.

Leanlings is a command-line exercise runner — inspired by
[rustlings](https://github.com/rust-lang/rustlings) — that teaches both
**programming** and **theorem proving** in Lean 4 through a single, guided
progression. Each exercise gives you a file with `sorry` placeholders to fill
in. A watch-mode compiler checks your work on every save and advances you to
the next exercise automatically.

## Why leanlings?

The Lean 4 ecosystem has excellent learning resources, but they tend to fall
into two camps: books you read alongside an editor, or browser games focused
exclusively on proofs. Leanlings occupies a different point in the design
space:

| | CLI runner | Watch mode | Programming | Proving | No IDE required |
|---|---|---|---|---|---|
| **Leanlings** | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
| [Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/) | — | — | Yes | — | — |
| [Theorem Proving in Lean 4](https://lean-lang.org/theorem_proving_in_lean4/) | — | — | — | Yes | — |
| [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/) | — | — | — | Yes | — |
| [Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/NNG4) | — | — | — | Yes | Yes |
| [Mechanics of Proof](https://hrmacbeth.github.io/math2001/) | — | — | — | Yes | — |
| [Tutorials4](https://github.com/leanprover-community/tutorials4) | — | — | — | Yes | — |
| [Glimpse of Lean](https://github.com/PatrickMassot/GlimpseOfLean) | — | — | — | Yes | — |

**In short:** leanlings is the only tool that walks you from `"Hello, Lean!"`
through inductive types, monads, and tactic proofs to induction on binary
trees, all inside a terminal with instant feedback.

## What you'll learn

The 70 exercises are organized into 27 units across three arcs:

**Arc 1 — Programming fundamentals** (units 0–7, 14–18)
Strings, arithmetic, functions, control flow, structures, inductive types,
recursion, do-notation, IO, implicit arguments, arrays, and namespaces.

**Arc 2 — Proof fundamentals** (units 8–12, 20–23)
`rfl`, `simp`, `omega`, propositions, tactics (`intro`, `exact`, `apply`,
`cases`, `constructor`, `rw`), induction, existentials, `have`, `calc`,
classical logic.

**Arc 3 — Putting it together** (units 24–26)
Proofs about natural number arithmetic, list operations, and a final capstone
on binary trees combining recursive functions with induction proofs.

Three checkpoint quizzes (units 13, 19, 26) tie everything together.

## Getting started

Install [elan](https://github.com/leanprover/elan) (the Lean version
manager), then:

```
git clone https://github.com/samuelschlesinger/leanlings.git
cd leanlings
lake build
lake exe leanlings watch
```

Open the exercise file shown in your editor, fix the code, and save.
The watcher will check your solution automatically and move to the next
exercise.

## Commands

```
lake exe leanlings           # show current exercise
lake exe leanlings run       # check current exercise
lake exe leanlings watch     # auto-check on save
lake exe leanlings hint      # show a hint
lake exe leanlings solution  # show the solution
lake exe leanlings list      # list all exercises
lake exe leanlings next      # skip to next exercise
lake exe leanlings reset     # reset current exercise
lake exe leanlings verify    # check all exercises
```

## Other resources

Leanlings is one entry point among many. Depending on where you are and what
you want to learn, these may serve you better — or pair well alongside
leanlings:

- **[Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/)** —
  The best resource for learning Lean as a programming language. Book format,
  thorough coverage of monads, type classes, and IO.
- **[Theorem Proving in Lean 4](https://lean-lang.org/theorem_proving_in_lean4/)** —
  The canonical reference for dependent type theory and proofs in Lean.
- **[Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/)** —
  Exercise-driven introduction to formalizing real mathematics with Mathlib.
  Hundreds of exercises, assumes some math background.
- **[Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/NNG4)** —
  Browser-based, no install needed. Excellent first taste of tactic proofs.
- **[Mechanics of Proof](https://hrmacbeth.github.io/math2001/)** —
  Undergraduate textbook pairing prose proofs with Lean. Gentle pace.
- **[Hitchhiker's Guide to Logical Verification](https://lean-forward.github.io/hitchhikers-guide/2024/)** —
  Graduate-level CS textbook covering semantics, Hoare logic, and more.
- **[Tutorials4](https://github.com/leanprover-community/tutorials4)** —
  Focused exercise set for tactic basics, good alongside TPIL.
- **[Glimpse of Lean](https://github.com/PatrickMassot/GlimpseOfLean)** —
  Fast-paced sampler of Lean proving across several math topics.
- **[Lean Game Server](https://adam.math.hhu.de/)** —
  Hosts the Natural Number Game and several other browser-based proof games.
- **[Metaprogramming in Lean 4](https://leanprover-community.github.io/lean4-metaprogramming-book/)** —
  For writing custom tactics, macros, and elaborators. Advanced.

## License

MIT
