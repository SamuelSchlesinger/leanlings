import Rat.left_distrib
namespace Analysis
open MyRat
theorem MyRat.right_distrib (x y z : MyRat) : (x + y) * z = x * z + y * z := by
  rw [MyRat.mul_comm, MyRat.left_distrib, MyRat.mul_comm z x, MyRat.mul_comm z y]
end Analysis
