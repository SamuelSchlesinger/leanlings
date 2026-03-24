/- # Functions 4: Higher-Order Functions

  Functions can take other functions as arguments.
  Lists have useful higher-order methods:

  • `List.map f`    — apply `f` to every element
  • `List.filter p` — keep elements where `p` is true

  Examples:
    [1, 2, 3].map (· + 10)       = [11, 12, 13]
    [1, 2, 3, 4].filter (· > 2)  = [3, 4]

  TODO: Use `map` and `filter` to transform the lists.
-/

-- Double every element: [1, 2, 3] → [2, 4, 6]
def doubled : List Nat := [1, 2, 3].map sorry

-- Keep only even numbers: [1, 2, 3, 4, 5, 6] → [2, 4, 6]
def evens : List Nat := [1, 2, 3, 4, 5, 6].filter sorry
