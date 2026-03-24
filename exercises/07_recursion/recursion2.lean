/- # Recursion 2: List Recursion

  Lists are recursive, so functions over lists are often
  recursive too. Match on empty and cons:

    def length : List α → Nat
      | []     => 0
      | _ :: t => 1 + length t

  TODO: Implement `sum` that adds all elements of a list.
        sum []        = 0
        sum [1, 2, 3] = 6
-/

def sum : List Nat → Nat := sorry
