/- # Type Classes 1: Using Type Classes

  Type classes provide overloaded operations:

  • `ToString α` — convert to String via `toString`
  • `Repr α` — display with `#eval` via `repr`
  • `BEq α` — equality check via `==`

  You can add these automatically with `deriving`:

    structure Foo where
      x : Nat
      deriving Repr, BEq

  Or define instances manually:

    instance : ToString Foo where
      toString f := s!"Foo({f.x})"

  TODO: Add a `ToString` instance for `Color`.
-/

inductive Color where
  | red
  | green
  | blue
  deriving Repr, BEq

-- TODO: Implement ToString for Color
instance : ToString Color where
  toString := sorry
