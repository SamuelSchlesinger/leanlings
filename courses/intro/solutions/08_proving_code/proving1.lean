def double (n : Nat) : Nat := n + n

def isEven (n : Nat) : Bool := n % 2 == 0

theorem double_3 : double 3 = 6 := rfl

theorem double_0 : double 0 = 0 := rfl

theorem four_is_even : isEven 4 = true := rfl

theorem double_2_is_add : double 2 = 2 + 2 := rfl
