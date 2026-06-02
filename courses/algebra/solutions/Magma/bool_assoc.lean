import Magma.bool_comm

namespace Algebra

theorem bool_assoc : ∀ a b c : Bool, a * b * c = a * (b * c) := by
  decide

end Algebra
