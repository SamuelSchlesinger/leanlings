/-
Infrastructure (given): the analysis toolkit on ℚ, and the definitions of Cauchy
sequences. With the arithmetic and order theory of `MyRat` in hand (which you
proved), we record the handful of inequality lemmas that the ε–N arguments need,
a decidable order and a binary `max`, and then define what it means for a
sequence of rationals to be Cauchy. The `Cauchy` world then asks you to prove the
basic facts about these sequences.
-/
import RatOrder.exists_between

namespace Analysis
open MyRat

/-! ### Algebra helpers -/

theorem MyRat.sub_self (a : MyRat) : a - a = 0 := by
  induction a using ind with | _ p q hq =>
  rw [sub_mk, zero_def, mk_eq]; grind

theorem MyRat.neg_sub (a b : MyRat) : -(a - b) = b - a := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  rw [sub_mk, neg_mk, sub_mk, mk_eq]; grind

theorem MyRat.sub_add_sub (a b c : MyRat) : (a - b) + (b - c) = a - c := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  induction c using ind with | _ t u hu =>
  rw [sub_mk, sub_mk, add_mk, sub_mk, mk_eq]; grind

theorem MyRat.add_sub_add (a b c d : MyRat) : (a + b) - (c + d) = (a - c) + (b - d) := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  induction c using ind with | _ t u hu =>
  induction d using ind with | _ v w hw =>
  rw [add_mk, add_mk, sub_mk, sub_mk, sub_mk, add_mk, mk_eq]; grind

theorem MyRat.neg_sub_neg (a b : MyRat) : (-a) - (-b) = b - a := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  rw [neg_mk, neg_mk, sub_mk, sub_mk, mk_eq]; grind

/-! ### Absolute value helpers -/

theorem MyRat.abs_zero : |(0 : MyRat)| = 0 := by
  rw [zero_def, abs_mk, mk_eq]; omega

theorem MyRat.abs_sub_comm (a b : MyRat) : |a - b| = |b - a| := by
  rw [← MyRat.abs_neg (a - b), MyRat.neg_sub]

/-- Triangle inequality in difference form. -/
theorem MyRat.abs_sub_le (a b c : MyRat) : |a - c| ≤ |a - b| + |b - c| := by
  rw [← MyRat.sub_add_sub a b c]
  exact MyRat.abs_add_le (a - b) (b - c)

/-! ### Order helpers -/

theorem MyRat.le_of_lt {a b : MyRat} (h : a < b) : a ≤ b := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  rw [lt_mk] at h; rw [le_mk]; omega

theorem MyRat.lt_of_le_of_lt {x y z : MyRat} (hxy : x ≤ y) (hyz : y < z) : x < z := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  induction z using ind with | _ e f hf =>
  rw [le_mk] at hxy; rw [lt_mk] at hyz ⊢
  have h1 := Int.mul_le_mul_of_nonneg_right hxy (Int.le_of_lt hf)
  have h2 := Int.mul_lt_mul_of_pos_right hyz hb
  have e3 : c * b * f = c * f * b := by grind
  rw [e3] at h1
  have h3 : a * d * f < e * d * b := Int.lt_of_le_of_lt h1 h2
  have e4 : a * d * f = a * f * d := by grind
  have e5 : e * d * b = e * b * d := by grind
  rw [e4, e5] at h3
  exact (Int.mul_lt_mul_right hd).mp h3

theorem MyRat.lt_of_lt_of_le {x y z : MyRat} (hxy : x < y) (hyz : y ≤ z) : x < z := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  induction z using ind with | _ e f hf =>
  rw [lt_mk] at hxy; rw [le_mk] at hyz; rw [lt_mk]
  have h1 := Int.mul_lt_mul_of_pos_right hxy hf
  have h2 := Int.mul_le_mul_of_nonneg_right hyz (Int.le_of_lt hb)
  have e3 : c * b * f = c * f * b := by grind
  rw [e3] at h1
  have h3 : a * d * f < e * d * b := Int.lt_of_lt_of_le h1 h2
  have e4 : a * d * f = a * f * d := by grind
  have e5 : e * d * b = e * b * d := by grind
  rw [e4, e5] at h3
  exact (Int.mul_lt_mul_right hd).mp h3

theorem MyRat.add_lt_add_right {a b : MyRat} (c : MyRat) (h : a < b) : a + c < b + c := by
  rw [MyRat.add_comm a c, MyRat.add_comm b c]; exact MyRat.add_lt_add_left c h

theorem MyRat.add_lt_add {a b c d : MyRat} (h1 : a < b) (h2 : c < d) : a + c < b + d :=
  MyRat.lt_trans (MyRat.add_lt_add_right c h1) (MyRat.add_lt_add_left b h2)

theorem MyRat.lt_of_not_le {a b : MyRat} (h : ¬ a ≤ b) : b < a := by
  rcases MyRat.lt_trichotomy a b with h1 | h1 | h1
  · exact absurd (MyRat.le_of_lt h1) h
  · exact absurd (h1 ▸ MyRat.le_refl a) h
  · exact h1

/-- `Trans` instances so `calc` chains can mix `<`, `≤`, and `=` on `MyRat`. -/
instance : Trans (· < · : MyRat → MyRat → Prop) (· < ·) (· < ·) := ⟨MyRat.lt_trans⟩
instance : Trans (· ≤ · : MyRat → MyRat → Prop) (· ≤ ·) (· ≤ ·) := ⟨MyRat.le_trans⟩
instance : Trans (· ≤ · : MyRat → MyRat → Prop) (· < ·) (· < ·) := ⟨MyRat.lt_of_le_of_lt⟩
instance : Trans (· < · : MyRat → MyRat → Prop) (· ≤ ·) (· < ·) := ⟨MyRat.lt_of_lt_of_le⟩

/-! ### Multiplicative order helpers (needed for products of Cauchy sequences) -/

theorem MyRat.zero_lt_one : (0 : MyRat) < 1 := by rw [zero_def, one_def, lt_mk]; omega

theorem MyRat.sub_add_cancel (a b : MyRat) : (a - b) + b = a := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  rw [sub_mk, add_mk, mk_eq]; grind

theorem MyRat.add_le_add_right {a b : MyRat} (c : MyRat) (h : a ≤ b) : a + c ≤ b + c := by
  rw [MyRat.add_comm a c, MyRat.add_comm b c]; exact MyRat.add_le_add_left c h

theorem MyRat.mul_lt_mul_of_pos_right {a b c : MyRat} (h : a < b) (hc : 0 < c) :
    a * c < b * c := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  induction c using ind with | _ t u hu =>
  rw [lt_mk] at h
  rw [zero_def, lt_mk] at hc
  rw [mul_mk, mul_mk, lt_mk]
  have ht : 0 < t := by omega
  have key := Int.mul_lt_mul_of_pos_right h (Int.mul_pos ht hu)
  have e1 : (p * t) * (s * u) = (p * s) * (t * u) := by grind
  have e2 : (r * t) * (q * u) = (r * q) * (t * u) := by grind
  rw [e1, e2]; exact key

theorem MyRat.lt_of_mul_lt_mul_right {a b c : MyRat} (hc : 0 < c) (h : a * c < b * c) :
    a < b := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  induction c using ind with | _ t u hu =>
  rw [mul_mk, mul_mk, lt_mk] at h
  rw [zero_def, lt_mk] at hc
  rw [lt_mk]
  have ht : 0 < t := by omega
  have e1 : (p * t) * (s * u) = (p * s) * (t * u) := by grind
  have e2 : (r * t) * (q * u) = (r * q) * (t * u) := by grind
  rw [e1, e2] at h
  exact Int.lt_of_mul_lt_mul_right h (Int.le_of_lt (Int.mul_pos ht hu))

theorem MyRat.mul_le_mul_of_nonneg_left {a b c : MyRat} (h : b ≤ c) (ha : 0 ≤ a) :
    a * b ≤ a * c := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  induction c using ind with | _ t u hu =>
  rw [le_mk] at h
  rw [zero_def, le_mk] at ha
  rw [mul_mk, mul_mk, le_mk]
  have hp : 0 ≤ p := by omega
  have key := Int.mul_le_mul_of_nonneg_left h (Int.mul_nonneg hp (Int.le_of_lt hq))
  have e1 : (p * r) * (q * u) = (p * q) * (r * u) := by grind
  have e2 : (p * t) * (q * s) = (p * q) * (t * s) := by grind
  rw [e1, e2]; exact key

theorem MyRat.inv_pos {a : MyRat} (ha : 0 < a) : 0 < a⁻¹ := by
  induction a using ind with | _ p q hq =>
  rw [zero_def, lt_mk] at ha
  have hp : 0 < p := by omega
  rw [inv_mk_of_ne hq (by omega), zero_def, lt_mk, Int.sign_eq_one_of_pos hp]
  omega

theorem MyRat.inv_mul_cancel (a : MyRat) (ha : a ≠ 0) : a⁻¹ * a = 1 := by
  rw [MyRat.mul_comm]; exact MyRat.mul_inv_cancel a ha

theorem MyRat.mul_le_mul_of_nonneg_right {a b c : MyRat} (h : a ≤ b) (hc : 0 ≤ c) :
    a * c ≤ b * c := by
  rw [MyRat.mul_comm a c, MyRat.mul_comm b c]; exact MyRat.mul_le_mul_of_nonneg_left h hc

theorem MyRat.mul_lt_mul_of_pos_left {a b c : MyRat} (h : a < b) (hc : 0 < c) :
    c * a < c * b := by
  rw [MyRat.mul_comm c a, MyRat.mul_comm c b]; exact MyRat.mul_lt_mul_of_pos_right h hc

theorem MyRat.le_add_one (a : MyRat) : a ≤ a + 1 := by
  have h := MyRat.add_le_add_left a (MyRat.le_of_lt MyRat.zero_lt_one)
  rw [MyRat.add_zero] at h; exact h

/-- For a positive rational `q` there is a positive `h` with `h + h = q` (a "half"). -/
theorem MyRat.exists_half {q : MyRat} (hq : 0 < q) : ∃ h : MyRat, 0 < h ∧ h + h = q := by
  induction q using ind with | _ a b hb =>
  rw [zero_def, lt_mk] at hq
  refine ⟨mk a (2 * b) (by omega), ?_, ?_⟩
  · rw [zero_def, lt_mk]; omega
  · rw [add_mk, mk_eq]; grind

/-! ### Decidable order and binary max -/

instance MyRat.instDecidableLE (x y : MyRat) : Decidable (x ≤ y) :=
  Quotient.recOnSubsingleton₂ x y
    (fun a b => inferInstanceAs (Decidable (a.num * b.den ≤ b.num * a.den)))

/-- The larger of two rationals. -/
def MyRat.max (a b : MyRat) : MyRat := if a ≤ b then b else a

theorem MyRat.le_max_left (a b : MyRat) : a ≤ MyRat.max a b := by
  unfold MyRat.max; split
  · rename_i h; exact h
  · exact MyRat.le_refl a

theorem MyRat.le_max_right (a b : MyRat) : b ≤ MyRat.max a b := by
  unfold MyRat.max; split
  · exact MyRat.le_refl b
  · rename_i h; exact MyRat.le_of_lt (MyRat.lt_of_not_le h)

/-! ### Cauchy sequences -/

/-- A sequence of rationals is **Cauchy** if its terms get arbitrarily close. -/
def IsCauchy (f : ℕ → MyRat) : Prop :=
  ∀ ε : MyRat, 0 < ε → ∃ N : ℕ, ∀ m n : ℕ, N ≤ m → N ≤ n → |f m - f n| < ε

/-- A sequence is **bounded** if some `M` dominates every `|f n|`. -/
def IsBounded (f : ℕ → MyRat) : Prop := ∃ M : MyRat, ∀ n : ℕ, |f n| ≤ M

/-- Two sequences are **equivalent** if their difference tends to `0`. -/
def CauchyEquiv (f g : ℕ → MyRat) : Prop :=
  ∀ ε : MyRat, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n → |f n - g n| < ε

/-- The constant sequence at `q`. -/
def constSeq (q : MyRat) : ℕ → MyRat := fun _ => q

end Analysis
