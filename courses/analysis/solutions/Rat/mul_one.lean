import Rat.one_mul
namespace Analysis
open MyRat
theorem MyRat.mul_one (x : MyRat) : x * 1 = x := by
  rw [MyRat.mul_comm, MyRat.one_mul]
end Analysis
