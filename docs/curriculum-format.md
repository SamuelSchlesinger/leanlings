# Curriculum export and validation

Leanlings owns the source material; frontends consume a versioned export.
From a built checkout, run:

```sh
lake env lean --run scripts/Export.lean > /tmp/leanlings.json
```

Schema version 1 contains `provider`, `leanToolchain`, and an ordered `courses`
array. Each course has an `id`, title, description, welcome/conclusion text,
an optional Markdown `guide` (empty when absent), ordered `units`, and ordered
`exercises`. Each unit has its directory `id` and optional Markdown `guide`.
The introductory course has a course guide and puts its unit explanations in
the exercise files. Display the course guide when starting a course, and offer
each unit's guide alongside its first exercise. Empty unit guides mean the
teaching material is in the exercise comments; they do not indicate an error.

An exercise contains:

| Field | Meaning |
| --- | --- |
| `id` | Course-local `unit/name`; stable progress identity |
| `unit`, `name` | The corresponding source directory and file stem |
| `kind` | `lean`; consumers select a renderer/runtime for this kind |
| `source` | Editable starting Lean source, including teaching comments |
| `solution` | Reference answer, suitable for an explicit reveal action |
| `hint` | A next step when the learner needs help |
| `checks` | Behavioral checks appended after the learner's source |
| `contracts` | Generated theorem-type and axiom checks appended afterward |
| `expectedOutput` | Exact stdout for an IO task, or null |

A consumer should namespace progress by provider, course, and exercise IDs,
and record the content and runtime versions used for a completion. Do not
identify exercises by their display name or position in the array. Some
courses have the same theorem name in several units.

The export is independent of authentication, persistence, editor widgets,
and the execution engine. It contains no learner drafts or account state.
A browser adapter needs matching Lean libraries for the declared toolchain;
this JSON is not a substitute for compiled WASM-compatible imports. Native
`.olean` files must not be mixed with an incompatible browser runtime.

## Checks preserve the mathematical task

`scripts/generate-contracts.py` compiles trusted reference solutions and emits
checks against their public, source-authored theorem types. It excludes
compiler-generated equation lemmas, imported declarations, and private
helpers so that different valid implementations and proofs remain possible.
Anonymous NNG tasks have stable theorem names to make the task checkable.

The generated `example` requires the named theorem at its expected type.
`#print axioms` also detects a remaining `sorryAx` dependency when a learner
has suppressed the ordinary warning. Program tasks have behavioral checks;
IO tasks additionally have exact output contracts. The files are distributed
with the curriculum and are not secret tests.

These are learning checks, not an adversarial examination system. The
learner controls a full Lean file; extra axioms, changed supporting
definitions, imports, or metaprograms can defeat pedagogical intentions.
Completing a task records practice, not an independently certified credential.
Run the native tools only on trusted local material, never as a public server
for arbitrary submissions.

## Authoring gate

After changing a reference theorem or its type, regenerate its contracts:

```sh
lake build
lake build Leanlings.Contracts
python3 scripts/generate-contracts.py
```

CI builds the course libraries, checks that generated contracts are current,
validates every listed reference answer with its checks, rejects unfinished
and empty submissions, verifies IO output, and tests runner regressions.
It also compiles the complete Lean examples in Markdown guides and selected
examples from introductory comments. Every `lean` fence in a guide must be
a standalone example with its own imports; use `text` for incomplete outlines.

`python3 tests/LearnerWorkflow.py` checks course switching, guide discovery,
failure feedback, progress correction, watch mode, and course completion in a
temporary learner workspace. Add `--all` to replay every exercise in order
through the CLI, submitting the reference answers. This tests the interaction
and reference path; assessing the explanations and difficulty still requires
reading the lessons and trying the techniques they teach.

Validation can be scoped while editing with `--course intro` (or another
course ID) on the contract generator and course validator. Before publishing,
run the full gate in `.github/workflows/ci.yml`. A browser release additionally
needs runtime-specific tests and real browser checks; passing the native
gate alone does not establish browser compatibility.
