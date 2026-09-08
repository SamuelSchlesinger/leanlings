import Real.one_mul
namespace Analysis
open MyReal
theorem MyReal.mul_one (x : MyReal) : x * 1 = x := by
  rw [MyReal.mul_comm, MyReal.one_mul]
end Analysis
