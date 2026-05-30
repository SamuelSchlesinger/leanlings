/- # Propositions 1: True, False, and Equality

  In Lean, propositions are types and proofs are values.

  • `True` is a proposition that is always provable.
    Its proof is `True.intro` (or `trivial`).

  • `False` is a proposition with NO constructors — it can
    never be proved. But if you somehow have `h : False`,
    you can prove anything with `nomatch h` (or `h.elim`).
    This works because pattern matching on zero cases is
    vacuously complete — there's nothing left to handle!

  • `a = b` is an equality proposition.
    When both sides are definitionally equal, `rfl` is a proof.
    (rfl stands for "reflexivity")

  TODO: Provide proofs for each theorem.
-/

-- True is trivially true
theorem obvious : True := sorry

-- 1 + 1 is definitionally equal to 2
theorem one_plus_one : 1 + 1 = 2 := sorry

-- String concatenation is definitionally computed
theorem hello_lean : "Hello, " ++ "Lean!" = "Hello, Lean!" := sorry

-- From False, anything follows (explosion / ex falso)
-- Hint: use `nomatch h` or `h.elim`
theorem false_implies_anything (h : False) : 2 + 2 = 5 := sorry
