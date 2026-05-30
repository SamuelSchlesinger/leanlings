/- # Functions 4: Higher-Order Functions

  Functions can take other functions as arguments.
  Lists have useful higher-order methods:

  • `List.map f`      — apply `f` to every element
  • `List.filter p`   — keep elements where `p` is true
  • `List.foldl f init` — combine elements left-to-right

  Examples:
    [1, 2, 3].map (· + 10)       = [11, 12, 13]
    [1, 2, 3, 4].filter (· > 2)  = [3, 4]
    [1, 2, 3].foldl (· + ·) 0    = 6   (0+1+2+3)

  TODO: Use `map`, `filter`, and `foldl` to transform the lists.
-/

-- Double every element: [1, 2, 3] → [2, 4, 6]
def doubled : List Nat := [1, 2, 3].map sorry

-- Keep only even numbers: [1, 2, 3, 4, 5, 6] → [2, 4, 6]
def evens : List Nat := [1, 2, 3, 4, 5, 6].filter sorry

-- Sum all elements using foldl
def total : Nat := [10, 20, 30].foldl sorry sorry

-- Don't change below this line!
#guard doubled == [2, 4, 6]
#guard evens == [2, 4, 6]
#guard total == 60
