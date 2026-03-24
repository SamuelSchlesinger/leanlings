/- # Namespaces 1: Organizing Code

  Namespaces group related definitions:

    namespace Geometry
      def area (r : Float) : Float := 3.14159 * r * r
    end Geometry

    #eval Geometry.area 5.0  -- fully qualified

  `open` brings names into scope:

    open Geometry in
    #eval area 5.0  -- no prefix needed

  `section` + `variable` lets you share parameters:

    section
      variable (n : Nat)
      def double := n + n    -- n is automatic parameter
      def triple := n + n + n
    end

  TODO: Complete the namespace and use `open`.
-/

namespace MyMath
  def square (n : Nat) : Nat := sorry
  def cube (n : Nat) : Nat := sorry
end MyMath

-- Use `open MyMath in` to call square and cube without prefix
def sumOfPowers (n : Nat) : Nat := sorry

-- Don't change below this line!
#guard MyMath.square 5 == 25
#guard MyMath.cube 3 == 27
#guard sumOfPowers 2 == 12
