/- # Propositions 1: True, False, and Equality

  In Lean, propositions are types and proofs are values.

  • `True` is a proposition that is always provable.
    Its proof is `True.intro` (or `trivial`).

  • `False` is a proposition with no constructors. There is no
    constructor you can use to build a proof of it. However, inside
    a theorem that ASSUMES `h : False`, you can use `nomatch h`
    (or `h.elim`) to prove its conclusion. Pattern matching has zero
    cases to handle because the assumed value has no constructor.

  • `a = b` is an equality proposition.
    When both sides are definitionally equal, `rfl` is a proof.
    (rfl stands for "reflexivity")

  TODO: Provide proofs for each theorem, keeping their statements.
  The last theorem does not prove `2 + 2 = 5` unconditionally: it
  assumes `False`. To use that theorem, a caller would first need
  to supply a proof of that assumption.
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
