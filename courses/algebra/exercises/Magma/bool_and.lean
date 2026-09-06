/- # One operation, no laws yet

A magma is a type with a binary operation, written `*`. Its definition
assumes no laws. These warm-ups use Boolean conjunction as a concrete
example: on `Bool`, `a * b` is `a && b`.

Compute the indicated product. The type annotation determines which
operation Lean uses; `rfl` can prove an equality that follows directly
from the definition.
-/
import AlgebraLib.Prelude

namespace Algebra

theorem bool_and : (true * false : Bool) = false := by
  sorry

end Algebra
