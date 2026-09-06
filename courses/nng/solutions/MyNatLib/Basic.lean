/-
The `MyNat` foundation: a from-scratch copy of the natural numbers.

Ported from the Natural Number Game (leanprover-community/NNG4), which is
licensed under Apache-2.0. See `courses/nng/LICENSE` and `courses/nng/NOTICE`.

Modifications: the upstream files depend on Mathlib and Batteries; this port is
rewritten to use only core Lean 4 so the leanlings `nng` course needs no heavy
dependencies. The mathematics (an axiomatic Peano development) is unchanged.
-/

/-- Our copy of the natural numbers, called `MyNat`, with notation `ℕ`. -/
inductive MyNat where
  | zero : MyNat
  | succ : MyNat → MyNat

attribute [pp_nodot] MyNat.succ

@[inherit_doc]
notation (name := MyNatNotation) (priority := 1000000) "ℕ" => MyNat

namespace MyNat

instance : Inhabited MyNat where
  default := MyNat.zero

/-- Convert a core `Nat` numeral into a `MyNat`. Numeral identities can be
proved by computation with `rfl`. The principles `rec'` and `casesOn'` below
present their base case as the literal `0`, so arithmetic rewrites match it
without an extra conversion from the constructor `MyNat.zero`. -/
@[reducible] def ofNat (x : Nat) : MyNat :=
  match x with
  | Nat.zero   => MyNat.zero
  | Nat.succ b => MyNat.succ (ofNat b)

/-- Convert a `MyNat` back into a core `Nat` (used for display and `decide`). -/
def toNat (x : MyNat) : Nat :=
  match x with
  | MyNat.zero   => Nat.zero
  | MyNat.succ b => Nat.succ (toNat b)

instance instOfNat {n : Nat} : OfNat MyNat n where
  ofNat := ofNat n

instance : ToString MyNat where
  toString p := toString (toNat p)

theorem zero_eq_0 : MyNat.zero = 0 := rfl

def one : MyNat := MyNat.succ 0

/-! ### Numeral lemmas

These relate the literals `1`, `2`, `3`, `4` to successors. They hold by
computation (the `OfNat` instance), so they are library givens rather than
exercises. -/

theorem one_eq_succ_zero : 1 = succ 0 := rfl
theorem two_eq_succ_one : 2 = succ 1 := rfl
theorem three_eq_succ_two : 3 = succ 2 := rfl
theorem four_eq_succ_three : 4 = succ 3 := rfl

/-! ### Addition, multiplication and powers

Following NNG, the operations are `opaque` and characterised by axioms (the
recursion equations) rather than defined by recursion. This keeps the early
levels honest: you can only use `add_zero`/`add_succ`, never definitional
unfolding. -/

opaque add : MyNat → MyNat → MyNat
instance instAdd : Add MyNat where add := MyNat.add

/-- `add_zero a` is a proof of `a + 0 = a`. -/
axiom add_zero (a : MyNat) : a + 0 = a
/-- `add_succ a d` is a proof of `a + succ d = succ (a + d)`. -/
axiom add_succ (a d : MyNat) : a + (succ d) = succ (a + d)

opaque mul : MyNat → MyNat → MyNat
instance instMul : Mul MyNat where mul := MyNat.mul

/-- `mul_zero a` is a proof of `a * 0 = 0`. -/
axiom mul_zero (a : MyNat) : a * 0 = 0
/-- `mul_succ a b` is a proof of `a * succ b = a * b + a`. -/
axiom mul_succ (a b : MyNat) : a * (succ b) = a * b + a

opaque pow : ℕ → ℕ → ℕ
instance instPow : Pow ℕ ℕ where pow := pow

-- ensure `a ^ b` elaborates both sides at type `MyNat`
macro_rules | `($x ^ $y) => `(HPow.hPow ($x : MyNat) ($y : MyNat))

/-- `pow_zero m` is a proof of `m ^ 0 = 1`. -/
axiom pow_zero (m : ℕ) : m ^ 0 = 1
/-- `pow_succ m n` is a proof of `m ^ succ n = m ^ n * m`. -/
axiom pow_succ (m n : ℕ) : m ^ (succ n) = m ^ n * m

/-! ### Order

`a ≤ b` is *defined* to mean `∃ c, b = a + c`, and `a < b` to mean
`a ≤ b ∧ ¬ b ≤ a`. -/

def le (a b : ℕ) := ∃ (c : ℕ), b = a + c
instance instLE : LE MyNat := ⟨MyNat.le⟩

theorem le_iff_exists_add (a b : ℕ) : a ≤ b ↔ ∃ (c : ℕ), b = a + c := Iff.rfl

def lt (a b : ℕ) := a ≤ b ∧ ¬ (b ≤ a)
instance instLT : LT MyNat := ⟨MyNat.lt⟩

theorem lt_iff (a b : ℕ) : a < b ↔ a ≤ b ∧ ¬ b ≤ a := Iff.rfl

/-! ### Custom recursors that display `0`

These mirror NNG: when you do induction, the base case is shown as `0` (the
`OfNat` form the axioms are stated with) rather than `MyNat.zero`. -/

/-- Induction principle whose base case is phrased with `0`. -/
@[elab_as_elim]
def rec' {P : ℕ → Prop} (zero : P 0)
    (succ : (n : ℕ) → (n_ih : P n) → P (MyNat.succ n)) (t : ℕ) : P t := by
  induction t with
  | zero => exact zero
  | succ n ih => exact succ n ih

/-- Case analysis principle whose zero case is phrased with `0`. -/
@[elab_as_elim]
def casesOn' {P : ℕ → Sort u} (t : ℕ) (zero : P 0)
    (succ : (a : ℕ) → P (MyNat.succ a)) : P t := by
  cases t with
  | zero => exact zero
  | succ n => exact succ n

end MyNat
