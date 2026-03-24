def squares : Array Nat := Id.run do
  let mut a := #[]
  for i in List.range 10 do
    a := a.push (i * i)
  return a

def myReverse (a : Array Nat) : Array Nat := Id.run do
  let mut result := #[]
  for i in List.range a.size do
    result := result.push a[a.size - 1 - i]!
  return result
