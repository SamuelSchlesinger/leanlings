import Division.div_self

namespace Algebra

/- # Unpack division before simplifying

Division was defined as multiplication by an inverse. Expand `a / 1` with
`div_eq`, then use your theorem about the inverse of `1` and the appropriate
identity law. This is an example of reducing new notation to established
operations.
-/
theorem div_one {G : Type _} [Group G] (a : G) : a / 1 = a := by
  sorry

end Algebra
