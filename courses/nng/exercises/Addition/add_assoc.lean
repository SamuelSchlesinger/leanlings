-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Addition.add_comm

namespace MyNat

/-
We've been adding up two numbers; in this level we will add up three.

  What does $x+y+z$ *mean*? It could either mean $(x+y)+z$, or it
  could mean $x+(y+z)$. In Lean, $x+y+z$ means $(x+y)+z$.

  But why do we care which one it means; $(x+y)+z$ and $x+(y+z)$ are *equal*!

  That's true, but we didn't prove it yet. Let's prove it now by induction.
-/
/-- On the set of natural numbers, addition is associative.
In other words, if $a, b$ and $c$ are arbitrary natural numbers, we have
$ (a + b) + c = a + (b + c). $ -/
theorem add_assoc (a b c : ℕ) : a + b + c = a + (b + c) := by
  sorry

end MyNat
