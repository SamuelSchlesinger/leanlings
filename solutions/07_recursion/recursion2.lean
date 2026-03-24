def sum : List Nat → Nat
  | []     => 0
  | h :: t => h + sum t
