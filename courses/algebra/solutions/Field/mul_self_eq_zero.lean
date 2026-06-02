import Field.mul_eq_zero

namespace Algebra

theorem mul_self_eq_zero {F : Type _} [Field F] (a : F) (h : a * a = 0) : a = 0 := by
  rcases mul_eq_zero a a h with ha | ha
  · exact ha
  · exact ha

end Algebra
