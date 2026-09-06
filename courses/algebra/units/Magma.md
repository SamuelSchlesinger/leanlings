# One operation, then its laws

A **magma** has a type and an operation taking two elements to one element of
the same type. No law is required. For example, strings with concatenation
form a magma. So do numbers with subtraction, even though subtraction is not
associative.

Our first example uses `Bool` with conjunction as `*`. The imported instance
tells Lean which operation to use:

```lean
import AlgebraLib.Prelude
open Algebra
example : (false * true : Bool) = false := by rfl
```

`rfl` succeeds because this concrete operation computes to `false`. For the
next two exercises, there are only four or eight choices of Boolean inputs;
`decide` can check all of them and produce a proof.

Afterward, explain why proving associativity for this example does not prove
it for every magma. The next unit makes associativity an explicit assumption.
