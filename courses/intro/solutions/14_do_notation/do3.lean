def countWhere (p : Nat → Bool) (l : List Nat) : Nat := Id.run do
  let mut count := 0
  for x in l do
    if p x then
      count := count + 1
  return count

def listMax (l : List Nat) : Nat := Id.run do
  let mut mx := 0
  for x in l do
    if x > mx then
      mx := x
  return mx
