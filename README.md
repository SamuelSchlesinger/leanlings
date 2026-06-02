# Leanlings

Learn Lean 4 by fixing small broken exercises, one at a time. It is modeled on
[rustlings](https://github.com/rust-lang/rustlings).

Each exercise is a Lean file with a `sorry` (or a deliberate mistake) for you to
fix. Run it in watch mode and the compiler rechecks your work every time you
save, then moves you on to the next exercise.

There are three courses and 219 exercises in total. None of them depend on
Mathlib; everything is plain core Lean 4.

## Courses

Exercises are grouped into courses under `courses/<id>/`. The `intro` course is
the default. List what is available and switch between courses whenever you
like:

```
lake exe leanlings courses        # list courses and your progress in each
lake exe leanlings course <id>    # switch to a course
```

Progress is tracked separately for each course, so switching back and forth
does not lose your place. Every course has an `exercises/` directory (the files
you edit) and a `solutions/` directory (reference answers).

- `intro` (70 exercises): Lean 4 as a programming language and as a proof
  assistant. It runs from strings and arithmetic through inductive types,
  recursion, and IO, and then into propositions, tactics, induction, and a few
  quizzes. There is more on this course below.
- `nng` (78 exercises): a port of the
  [Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/nng4).
  You build the natural numbers from the Peano axioms and prove their basic
  theory (addition, multiplication, powers, and `≤`) across nine worlds. The
  original game needs Mathlib; this port reimplements the `MyNat` development in
  core Lean instead. It is used under the Apache-2.0 license, with attribution
  and the changes made recorded in `courses/nng/NOTICE`.
- `algebra` (71 exercises): abstract algebra in the Bourbaki style. You climb
  the algebraic hierarchy one axiom at a time (magma, semigroup, monoid, group,
  commutative group, homomorphisms, ring, commutative ring, field) and prove
  each level's basic theory from its axioms. The hierarchy is defined from
  scratch in core Lean (`AlgebraLib`), and each exercise proves a theorem that
  holds in every structure of that kind.

## The intro course

Its 70 exercises run across 27 units in three parts.

Programming (units 0 to 7 and 14 to 18): strings, arithmetic, functions,
control flow, structures, inductive types, recursion, do-notation, IO, implicit
arguments, arrays, and namespaces.

Proofs (units 8 to 12 and 20 to 23): `rfl`, `simp`, `omega`, propositions, the
tactics `intro`, `exact`, `apply`, `cases`, `constructor`, and `rw`, then
induction, existentials, `have`, `calc`, and classical logic.

Putting it together (units 24 to 26): proofs about natural number arithmetic
and list operations, ending with a capstone on binary trees that combines
recursive functions with induction. Three quizzes (units 13, 19, and 26) review
what came before.

## Getting started

Install [elan](https://github.com/leanprover/elan), the Lean version manager.
Then:

```
git clone https://github.com/samuelschlesinger/leanlings.git
cd leanlings
lake build
lake exe leanlings watch
```

Run `lake build` once before you start; it compiles the tool and the course
libraries. Open the exercise file the watcher points you to, fix the code, and
save. It rechecks on every save and moves on once the exercise passes.

## Commands

```
lake exe leanlings           # show the current exercise and your progress
lake exe leanlings run       # check the current exercise
lake exe leanlings run <ex>  # check a specific exercise
lake exe leanlings watch     # recheck automatically on save
lake exe leanlings hint      # show a hint for the current exercise
lake exe leanlings solution  # show the reference solution
lake exe leanlings list      # list the current course's exercises
lake exe leanlings next      # move to the next exercise
lake exe leanlings reset     # restore the current exercise to its original state
lake exe leanlings verify    # check every exercise in the current course
lake exe leanlings courses   # list courses
lake exe leanlings course X  # switch to course X
```

## Other places to learn Lean 4

A few resources worth knowing about, depending on what you are after:

- [Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/NNG4):
  a good first taste of proofs. It runs in the browser with no install and
  teaches tactics through a game. The `nng` course here is a port of it.
- [Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/):
  the book for learning Lean as a programming language, including monads, type
  classes, and IO.
- [Theorem Proving in Lean 4](https://lean-lang.org/theorem_proving_in_lean4/):
  the reference for dependent type theory and the proof side of Lean.
- [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/):
  hands-on exercises for formalizing real mathematics with Mathlib.
- [Mechanics of Proof](https://hrmacbeth.github.io/math2001/): an undergraduate
  textbook that teaches proof writing in prose and in Lean side by side. Good if
  you are new to proofs in general.
- [Glimpse of Lean](https://github.com/PatrickMassot/GlimpseOfLean): a short
  sampler you can finish in an afternoon.
- [Tutorials4](https://github.com/leanprover-community/tutorials4): tactic
  exercises adapted from an undergraduate real analysis course.
- [Hitchhiker's Guide to Logical Verification](https://lean-forward.github.io/hitchhikers-guide/2024/):
  a graduate CS textbook covering semantics, Hoare logic, and verification.
- [Lean Game Server](https://adam.math.hhu.de/): hosts the Natural Number Game
  and other browser-based proof games.
- [Metaprogramming in Lean 4](https://leanprover-community.github.io/lean4-metaprogramming-book/):
  for writing your own tactics, macros, and elaborators.

## License

MIT. The `nng` course is adapted from the Natural Number Game and is used under
the Apache-2.0 license; see `courses/nng/LICENSE` and `courses/nng/NOTICE`.
