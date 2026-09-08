import Real.zero_add
namespace Analysis
open MyReal
theorem MyReal.add_zero (x : MyReal) : x + 0 = x := by
  rw [MyReal.add_comm, MyReal.zero_add]
end Analysis
