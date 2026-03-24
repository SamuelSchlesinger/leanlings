/- # Arrays 2: Building Arrays

  You can build arrays programmatically:

    Array.mkArray 5 0        -- #[0, 0, 0, 0, 0]
    Array.range 5             -- #[0, 1, 2, 3, 4]
    #[1, 2] ++ #[3, 4]       -- #[1, 2, 3, 4]

  Or use `Id.run do` with mutable arrays:

    Id.run do
      let mut a := #[]
      for i in List.range 5 do
        a := a.push (i * i)
      return a                -- #[0, 1, 4, 9, 16]

  TODO: Build these arrays.
-/

-- The first 10 squares: #[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
def squares : Array Nat := sorry

-- Reverse an array (without using Array.reverse)
def myReverse (a : Array Nat) : Array Nat := sorry

-- Don't change below this line!
#guard squares == #[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
#guard myReverse #[1, 2, 3] == #[3, 2, 1]
#guard myReverse #[] == #[]
