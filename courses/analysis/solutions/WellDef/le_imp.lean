import WellDef.lt_imp

namespace Analysis

theorem PreRat.le_imp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d)
    (h : PreRat.leAux a b) : PreRat.leAux c d := by
  have hac' : a.num * c.den = c.num * a.den := hac
  have hbd' : b.num * d.den = d.num * b.den := hbd
  unfold PreRat.leAux at *
  have key := Int.mul_le_mul_of_nonneg_right h (Int.le_of_lt (Int.mul_pos c.den_pos d.den_pos))
  have e1 : a.num * b.den * (c.den * d.den) = (c.num * d.den) * (a.den * b.den) := by grind
  have e2 : b.num * a.den * (c.den * d.den) = (d.num * c.den) * (a.den * b.den) := by grind
  rw [e1, e2] at key
  exact (Int.mul_le_mul_right (Int.mul_pos a.den_pos b.den_pos)).mp key

end Analysis
