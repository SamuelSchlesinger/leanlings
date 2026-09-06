import Magma.bool_and

namespace Algebra

/- # A concrete operation can have extra laws

A magma does not promise commutativity. This particular operation, Boolean
conjunction, does have it. Prove the statement for all four pairs of Boolean
values. You can introduce the variables and split into cases, or ask `decide`
to check the finite proposition. Explain why this proof would not work for an
arbitrary magma.
-/
theorem bool_comm : ∀ a b : Bool, a * b = b * a := by
  sorry

end Algebra
