/- # Recursion 3: Accumulator Pattern

  Sometimes it helps to carry an accumulator — an extra parameter
  that builds up the result:

    def sum (l : List Nat) : Nat :=
      go l 0
    where
      go : List Nat → Nat → Nat
        | [], acc     => acc
        | h :: t, acc => go t (acc + h)

  The `where` clause defines a local helper function.

  TODO: Implement `reverse` using an accumulator.
        reverse [1, 2, 3] = [3, 2, 1]
-/

def reverse (l : List α) : List α :=
  sorry
