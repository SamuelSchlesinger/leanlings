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

  In the task below, `α` stands for any element type. Your reverse
  function must work for lists of numbers, strings, or other values,
  without inspecting the values themselves. For example, moving the
  head of [1, 2, 3] onto an empty accumulator gives remaining input
  [2, 3] and accumulator [1]. What happens at the next two steps?

  TODO: Implement `reverse` using an accumulator.
        reverse [1, 2, 3] = [3, 2, 1]
-/

def reverse (l : List α) : List α :=
  sorry
