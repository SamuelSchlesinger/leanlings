namespace MyMath
  def square (n : Nat) : Nat := n * n
  def cube (n : Nat) : Nat := n * n * n
end MyMath

def sumOfPowers (n : Nat) : Nat :=
  open MyMath in
  square n + cube n
