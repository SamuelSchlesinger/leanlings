# Curriculum and learner workflow review

Reviewed on 2026-09-08, starting from commit `7528b65`.

The four courses have a coherent progression and worthwhile mathematical
content. The main weaknesses were missing explanations at transitions, hints
that did not work from the learner's starting point, and feedback that hid
the reason an answer failed. The changes accompanying this review address
those problems while preserving the required statements in all 283 exercises.

## Scope and method

Read every exercise's instructions, hint, and reference answer in configured
course order, together with the course and unit guides. Inspected the native
CLI's course selection, checking, progression, completion, help, and export.

The full workflow test uses a disposable learner checkout. For every task it
reads the hint and reference without changing progress, checks that the
unfinished starter fails, submits the reference, and verifies progression.
It also visits every unit's guide and checks each course's completion message.
This is an exhaustive reference replay through the CLI, not an independent
solution of every problem or a study of novice learning outcomes.

Eight additional submissions were assembled to try the techniques taught in
the lessons: Intro's list fold; NNG's addition macro and multiplication
cancellation; Algebra's inverse-product law and identity preservation;
Analysis's rational and real left identity proofs and the final approximation
estimate. These all passed the actual exercise checker.

This checkout contains the curriculum and native CLI. Hosted browser behavior
and retention by students were not evaluated in this review.

## Course assessments

| Course | Coverage | Assessment and changes |
| --- | --- | --- |
| Intro | 70 exercises, 27 units | A useful first course combining programs and their specifications. Added a course guide with a study loop, notation reference, recovery advice, and checkpoints. Explained remainder and folds, Boolean versus propositional comparisons, proof branches, pairs, `do` bindings, safe array access, tree induction, and list membership before they are needed. Corrected the `Except` hint and scoped the finale to Intro. |
| Natural Number Game | 78 exercises, 9 worlds | The incremental use of induction and earlier arithmetic laws provides strong practice. Fixed the undefined `simp_add` tactic that the lesson asked learners to use. Introduced missing theorem names and branch syntax, explained `have` and excluded middle where used, and removed promises about worlds absent from this port. Distinguished a constructor theorem from an assumed arithmetic axiom. |
| Algebra | 71 exercises, 10 units | The hierarchy makes the role of assumptions visible, with concrete Boolean structures before abstract laws. Corrected homomorphism hints to use the available `f.toFun` notation and added a complete homomorphism construction. Clarified qualified ring laws and the field axiom about the inverse of zero. |
| Analysis | 64 exercises, 10 units | A substantial advanced construction course. It requires comfort with inequalities and epsilon arguments in addition to Lean tactics. Revised hints to include quotient representatives, added a worked representative-selection proof and cast examples, and illustrated equivalent sequences with unequal first terms. Five reference proofs now reuse established laws, teaching when to leave representative calculations behind. Welcome and completion text accurately credit the supplied proved infrastructure. |

The guides now ask learners to explain an argument, inspect the resulting
goal before invoking automation, and reconstruct a revealed solution. These
are useful learning checks beyond obtaining an accepted file. The larger
Intro quizzes and the final Analysis construction are explicitly presented
as synthesis tasks with several steps.

## Reproduced problems and fixes

| Problem | Effect on a learner | Resolution |
| --- | --- | --- |
| `nng/Algorithm/add_algo3` mentioned a macro declared only inside a comment | Following the requested `simp_add` technique produced `unknown tactic`, even though the reference passed | Supply the macro in the editable file and reference; the workflow test exercises the taught tactic in the starter itself |
| Several Analysis hints began with `*_mk` rewrites on arbitrary quotient values | Following the hint failed before reaching the advertised arithmetic step | Explain and include representative selection; distinguish quotient induction from recursive induction |
| Algebra homomorphism hints used `f a` | The minimal `GroupHom` has no conversion to a function | Use `f.toFun a` and show how its function and law are constructed |
| The Intro `Except` hint described failure as `none` | It taught the failure mechanism of a different type | Explain `.error`, `.ok`, and the result passed to the next check |
| Course and unit guides were hard to discover from the CLI | Learners could miss explanations already available in the repository | Add `guide` and `guide <exercise>`, show guide locations during the workflow, and group the exercise list by unit |
| Appended exercise-check diagnostics were discarded | A plausible wrong answer received only a generic rejection | Preserve the detailed diagnostic and identify the exercise and check files |
| A failed manual recheck retained an earlier completion mark | Displayed progress could contradict the latest checked answer | Revoke completion on failure while preserving other progress |
| Manual completion of the last task suggested `next` instead of showing the finale | The course ending did not acknowledge completion | Show the current course's completion message immediately |

## Validation

All of the following checks passed locally. They cover both mathematical
acceptance and learner interactions:

- `lake build` and `lake build Leanlings.Contracts`.
- `lake env lean --run tests/LeanlingsRegression.lean`.
- `python3 tests/ContractGeneration.py` and
  `python3 scripts/generate-contracts.py --check`: 310 theorem contracts
  verified across 283 exercises.
- `python3 scripts/validate-courses.py`: 283 reference answers accepted,
  including exact IO output checks; all unfinished and empty submissions
  rejected.
- `lake env lean tests/TeachingExamples.lean` and
  `python3 scripts/validate-guides.py`: all 34 complete guide examples compile
  without unfinished proofs, alongside the selected introductory examples.
- `python3 tests/LearnerWorkflow.py`: guides for all 56 units, course
  transitions, detailed wrong-answer feedback, failed rechecks, completion,
  and actual saves in a terminal running watch mode.
- `python3 tests/LearnerWorkflow.py --all`: all 283 tasks through the native
  CLI in order, plus the workflow checks above.
- `git diff --check`.

The default learner workflow test is included in CI. The exhaustive replay
is available for larger curriculum reviews. Generated contract changes only
refresh reference-source hashes; the required theorem types are unchanged.

These checks establish that the material and intended paths work locally on
the pinned Lean toolchain. A next educational evaluation would ask learners
at each course's stated prerequisite level to explain and transfer the ideas
without viewing reference answers, especially at the first induction,
quotient, and epsilon proofs.
