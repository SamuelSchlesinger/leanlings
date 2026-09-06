/-
Tactic conveniences used by this port: `use`, the game's short induction and
case syntax, `apply … at`, `nth_rewrite`, and equality reversal at a hypothesis.

Ported in spirit from leanprover-community/NNG4 (Apache-2.0); the upstream
version wraps Mathlib's `use`, this is a small core-only macro. See
`courses/nng/LICENSE` and `courses/nng/NOTICE`.

The solutions generally use core Lean's explicit branch syntax, such as
`induction n using MyNat.rec' with | zero => … | succ d hd => …`, and `rewrite`
(which, unlike `rw`, does not auto-close with `rfl`). The short forms below are
local extensions; they are not syntax to assume in an unrelated Lean project.
-/
import Lean
import MyNatLib.Basic

namespace MyNat
open Lean.Parser.Tactic

/-- For a goal `∃ x, P x`, `use w` supplies the witness `w` and leaves `P w`.
Unlike Mathlib's `use` it does not try to discharge the remaining goal. -/
macro "use " args:term,+ : tactic =>
  `(tactic| refine ⟨$args,*, ?_⟩)

/-- Lean3-style `induction n with d hd`: induct on `n : ℕ`, naming the successor
predecessor `d` and the induction hypothesis `hd`. The base case is shown as `0`.
The two resulting goals are addressed by the following `·` bullets. -/
syntax (name := lean3Induction) "induction " term " with " ident ppSpace ident : tactic
macro_rules (kind := lean3Induction)
  | `(tactic| induction $n:term with $d:ident $hd:ident) =>
    `(tactic| induction $n:term using MyNat.rec' with
        | zero => ?_
        | succ $d $hd => ?_)

/-- `apply f at h` : given a function `f` and a hypothesis `h : A`, find the
argument of `f` whose type unifies with `A`, apply `f` to `h` (inferring the
other arguments), and replace `h` with the result. (Core Lean's `apply` has no
`at` form; this fills that gap, like Mathlib's `apply … at`.) -/
syntax (name := applyAt) "apply " term " at " ident : tactic

open Lean Lean.Meta Lean.Elab Lean.Elab.Tactic in
elab_rules : tactic
  | `(tactic| apply $f:term at $hyp:ident) => withMainContext do
    let goal ← getMainGoal
    let some ldecl := (← getLCtx).findFromUserName? hyp.getId
      | throwError "apply at: unknown hypothesis '{hyp.getId}'"
    let hType ← instantiateMVars ldecl.type
    let fExpr ← Term.elabTermAndSynthesize f none
    let (mvars, _, _) ← forallMetaTelescopeReducing (← inferType fExpr)
    let mut chosen := none
    for i in [0:mvars.size] do
      if (← isDefEq (← inferType mvars[i]!) hType) then chosen := some i; break
    let some ci := chosen
      | throwError "apply at: no argument of the function matches '{hyp.getId} : {hType}'"
    mvars[ci]!.mvarId!.assign ldecl.toExpr
    -- Apply only up to and including the matched argument; the remaining binders
    -- belong to the conclusion (e.g. when the result type is itself `_ → _`).
    let result ← instantiateMVars (mkAppN fExpr (mvars.extract 0 (ci + 1)))
    let resultType ← instantiateMVars (← inferType result)
    let newGoal ← goal.assert ldecl.userName resultType result
    let (_, newGoal) ← newGoal.intro1P
    replaceMainGoal [← newGoal.tryClear ldecl.fvarId]

/-- `nth_rewrite n [h]` rewrites only the `n`-th occurrence of the pattern,
using core `rewrite`'s occurrence configuration. -/
syntax (name := nthRewrite) "nth_rewrite " num rwRuleSeq (location)? : tactic
macro_rules
  | `(tactic| nth_rewrite $n:num $rs:rwRuleSeq $[$loc:location]?) =>
    `(tactic| rewrite (config := { occs := .pos [$n] }) $rs:rwRuleSeq $[$loc:location]?)

/-- lean3-style `cases e with a b …`. On a natural number, `cases n with d`
splits into the `0` case and the `succ d` case (with `0` shown). On a hypothesis,
the names are distributed across the resulting constructors' fields: for a
one-constructor type (`∃`, `∧`) they bind its fields; for `∨` they name the field
of each goal. (`colGt` stops the name list from swallowing the next tactic.) -/
syntax (name := lean3Cases) "cases " term " with " (ppSpace colGt ident)+ : tactic

open Lean Lean.Meta Lean.Elab Lean.Elab.Tactic in
elab_rules (kind := lean3Cases) : tactic
  | `(tactic| cases $e:term with $ids:ident*) => withMainContext do
    let idents := ids
    let scrut ← elabTerm e none
    let scrutTy ← instantiateMVars (← inferType scrut)
    if (← whnf scrutTy).isAppOf ``MyNat && idents.size == 1 then
      let d := idents[0]!
      evalTactic (← `(tactic| cases $e:term using MyNat.casesOn' with
        | zero => ?_
        | succ $d => ?_))
    else
      let names := idents.map (·.getId)
      let subgoals ← (← getMainGoal).cases scrut.fvarId!
      let mut newGoals := #[]
      let mut k := 0
      for sg in subgoals do
        let mut mv := sg.mvarId
        for f in sg.fields do
          if k < names.size then
            if f.isFVar then
              mv ← mv.rename f.fvarId! names[k]!
            k := k + 1
        newGoals := newGoals.push mv
      replaceMainGoal newGoals.toList

/-- `symm at h` turns a hypothesis `h : a = b` into `h : b = a`. -/
syntax (name := symmAt) "symm " "at " ident : tactic
macro_rules (kind := symmAt)
  | `(tactic| symm at $h:ident) => `(tactic| have $h := Eq.symm $h)

end MyNat
