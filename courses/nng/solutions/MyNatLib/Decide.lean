/-
Decidable equality for `MyNat`, plus the numeral-unfolding lemmas the
Algorithm-world `decide` levels need. Ported from leanprover-community/NNG4
(Apache-2.0); core Lean only. See `courses/nng/LICENSE`.

`+`/`*`/`^` are opaque, so `decide` cannot evaluate them directly. The idiom is
`simp only [...]` (unfolding numerals and the recursion equations to a `succ`/`0`
normal form) followed by `decide` (which uses `DecidableEq MyNat`).
-/
import MyNatLib.Basic
import MyNatLib.Peano

namespace MyNat

/-- Unfold a numeral literal one `succ` at a time. -/
theorem ofNat_succ (n : Nat) :
    (OfNat.ofNat (n + 1) : MyNat) = MyNat.succ (OfNat.ofNat n) := rfl

theorem ofNat_zero : (OfNat.ofNat 0 : MyNat) = MyNat.zero := rfl

/-- Decidable equality, built from `succ_inj` and `zero_ne_succ`. -/
instance instDecidableEq : (a b : MyNat) → Decidable (a = b)
  | .zero,   .zero   => isTrue rfl
  | .zero,   .succ n => isFalse (zero_ne_succ n)
  | .succ m, .zero   => isFalse (fun h => zero_ne_succ m h.symm)
  | .succ m, .succ n =>
    match instDecidableEq m n with
    | isTrue h  => isTrue (by rw [h])
    | isFalse h => isFalse (fun hs => h (succ_inj hs))

end MyNat
