import WellDef.neg_resp

namespace Analysis

theorem PreRat.lt_imp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d)
    (h : PreRat.ltAux a b) : PreRat.ltAux c d := by
  have hac' : a.num * c.den = c.num * a.den := hac
  have hbd' : b.num * d.den = d.num * b.den := hbd
  unfold PreRat.ltAux at *
  -- Scale the strict inequality by the positive product `c.den * d.den`.
  have key := Int.mul_lt_mul_of_pos_right h (Int.mul_pos c.den_pos d.den_pos)
  have e1 : a.num * b.den * (c.den * d.den) = (c.num * d.den) * (a.den * b.den) := by grind
  have e2 : b.num * a.den * (c.den * d.den) = (d.num * c.den) * (a.den * b.den) := by grind
  rw [e1, e2] at key
  exact (Int.mul_lt_mul_right (Int.mul_pos a.den_pos b.den_pos)).mp key

end Analysis
