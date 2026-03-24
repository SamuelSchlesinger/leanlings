# Leanlings

Learn Lean 4 by fixing 70 small exercises, one at a time.

Leanlings is a command-line exercise runner — inspired by
[rustlings](https://github.com/rust-lang/rustlings) — that teaches both
**programming** and **theorem proving** in Lean 4 through a single, guided
progression. Each exercise gives you a file with `sorry` placeholders to fill
in. A watch-mode compiler checks your work on every save and advances you to
the next exercise automatically.

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

## Great resources for learning Lean 4

The Lean community has produced wonderful learning materials. Here are some
favorites — reach for whichever fits where you are right now:

- **[Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/NNG4)** —
  The best place to start if you've never seen a proof assistant. Runs in the
  browser, no install needed, and teaches tactic proofs through a beautifully
  paced game.
- **[Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/)** —
  The go-to book for learning Lean as a programming language. Deep, clear
  coverage of monads, type classes, and IO. Reach for this when you want to
  understand *why* things work, not just *how*.
- **[Theorem Proving in Lean 4](https://lean-lang.org/theorem_proving_in_lean4/)** —
  The canonical reference for dependent type theory and the proof side of Lean.
  Essential reading once you're comfortable with the basics.
- **[Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/)** —
  Hands-on exercises for formalizing real mathematics with Mathlib. If you have
  some math background and want to formalize it, start here.
- **[Mechanics of Proof](https://hrmacbeth.github.io/math2001/)** —
  A gentle undergraduate textbook that teaches proof writing in prose and Lean
  side by side. Great if you're new to proofs in general.
- **[Glimpse of Lean](https://github.com/PatrickMassot/GlimpseOfLean)** —
  A fast-paced sampler you can finish in an afternoon. Perfect if you want a
  quick taste of several mathematical topics in Lean.
- **[Tutorials4](https://github.com/leanprover-community/tutorials4)** —
  Focused tactic exercises adapted from an undergraduate real analysis course.
  Pairs nicely with Theorem Proving in Lean 4.
- **[Hitchhiker's Guide to Logical Verification](https://lean-forward.github.io/hitchhikers-guide/2024/)** —
  A graduate-level CS textbook covering semantics, Hoare logic, and more.
  Reach for this when you're ready to go deep on verification.
- **[Lean Game Server](https://adam.math.hhu.de/)** —
  Hosts the Natural Number Game and several other browser-based proof games
  on topics like set theory and logic.
- **[Metaprogramming in Lean 4](https://leanprover-community.github.io/lean4-metaprogramming-book/)** —
  For when you want to write your own tactics, macros, and elaborators.
  Advanced, but very rewarding.

## License

MIT
