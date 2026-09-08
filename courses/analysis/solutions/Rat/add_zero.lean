import Rat.zero_add
namespace Analysis
open MyRat
theorem MyRat.add_zero (x : MyRat) : x + 0 = x := by
  rw [MyRat.add_comm, MyRat.zero_add]
end Analysis
