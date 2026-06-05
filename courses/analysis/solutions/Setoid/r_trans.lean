import Setoid.r_symm

namespace Analysis

theorem PreRat.r_trans {a b c : PreRat} (hab : PreRat.r a b) (hbc : PreRat.r b c) :
    PreRat.r a c := by
  unfold PreRat.r at *
  -- Cross-multiply and cancel the positive denominator `b.den`.
  apply Int.eq_of_mul_eq_mul_right (a := b.den) (by have := b.den_pos; omega)
  calc a.num * c.den * b.den
      = a.num * b.den * c.den := by rw [Int.mul_right_comm]
    _ = (b.num * a.den) * c.den := by rw [hab]
    _ = b.num * c.den * a.den := by rw [Int.mul_right_comm]
    _ = (c.num * b.den) * a.den := by rw [hbc]
    _ = c.num * a.den * b.den := by rw [Int.mul_right_comm]

end Analysis
