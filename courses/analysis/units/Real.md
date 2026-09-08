# A real is represented by an approximation process

`MyReal.mk f hf` is the real represented by a rational sequence `f`, with
`hf` proving it is Cauchy. Two such sequences represent the same real when
their difference tends to zero.

Pointwise equality is one sufficient reason:

```lean
import Real.Defs
open Analysis
example (f g : Nat → MyRat) (hf : IsCauchy f) (hg : IsCauchy g)
    (h : ∀ n, f n = g n) : MyReal.mk f hf = MyReal.mk g hg := by
  exact MyReal.eq_of_equiv (MyReal.equiv_of_eq h)
```

For an algebraic identity, choose representatives for the real inputs,
compute the operations on those representatives, and prove the rational
identity at each index. The matching `MyRat` theorem often finishes that
last step. Here is the whole pattern, on a law that is not one of the
exercises:

```lean
import Real.Defs
open Analysis
example (x : MyReal) : -(-x) = x := by
  induction x using MyReal.ind with | _ f hf =>
  rw [MyReal.neg_mk, MyReal.neg_mk]
  exact MyReal.eq_of_equiv (MyReal.equiv_of_eq (fun n => MyRat.neg_neg _))
```

`MyReal.ind` plays the role `MyRat.ind` played for fractions: the branch
names a sequence and its Cauchy proof.

General equality of reals may need a genuine convergence estimate instead.
Do not replace “difference tends to zero” by “equal at every index” when
stating the relation itself.

For a concrete contrast, change just the first term of the zero sequence:

```lean
import Real.Defs
open Analysis
example : CauchyEquiv (fun n => if n = 0 then (1 : MyRat) else 0)
    (constSeq 0) := by
  intro ε hε
  refine ⟨1, fun n hn => ?_⟩
  have hn0 : n ≠ 0 := by omega
  simp only [hn0, if_false, constSeq]
  rw [MyRat.sub_self, MyRat.abs_zero]
  exact hε
```

The first terms differ, but beyond index 1 the difference is zero. The same
threshold works for every positive tolerance. This explains why equality of
represented reals can ignore finitely many terms, and why the inverse law
later needs its estimate only past a threshold.

## Toolkit

All in the `MyReal` namespace:

- `add_mk`, `neg_mk`, `mul_mk`, `sub_mk`: an operation on `mk`s is the `mk`
  of the pointwise operation, for example
  `add_mk f g hf hg : mk f hf + mk g hg = mk (fun n => f n + g n) _`
- `zero_def`, `one_def`: `0` and `1` are the constant sequences `constSeq 0`
  and `constSeq 1`
- `ofRat_def : ofRat q = mk (constSeq q) _`
- `eq_of_equiv : CauchyEquiv f g → mk f hf = mk g hg`
- `equiv_of_eq : (∀ n, f n = g n) → CauchyEquiv f g`
