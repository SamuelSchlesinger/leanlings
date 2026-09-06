/-
Everything an `nng` level needs in scope: the `MyNat` foundation plus the
standard Lean tactics. Level files import this (transitively, via the
previous level) and add their lemma.
-/
import MyNatLib.Basic
import MyNatLib.Peano
import MyNatLib.Decide
