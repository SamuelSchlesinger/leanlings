import CommGroup.mul_left_comm

namespace Algebra

/- # Swap the final two factors

The target keeps `a` fixed and exchanges `b` and `c`. Group the final pair
before commuting it, then reassociate back. Explicit arguments to
`CommGroup.mul_comm` can select the intended pair when several products match.
-/
theorem mul_right_comm {G : Type _} [CommGroup G] (a b c : G) : a * b * c = a * c * b := by
  sorry

end Algebra
