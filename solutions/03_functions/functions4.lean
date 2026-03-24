def doubled : List Nat := [1, 2, 3].map (· * 2)

def evens : List Nat := [1, 2, 3, 4, 5, 6].filter (· % 2 == 0)
