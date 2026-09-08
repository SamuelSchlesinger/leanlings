/- # Implicit Arguments 1: Curly Braces

  In Lean, arguments in `{...}` are implicit — Lean infers them:

    def identity {α : Type} (x : α) : α := x

    #check identity 42        -- Nat
    #check identity "hello"   -- String

  Compare this version with an explicit type parameter:

    def identityExplicit (α : Type) (x : α) : α := x
    #check identityExplicit Nat 42

  Here the caller supplies `Nat` before the value 42.

  The tasks also use pairs: `α × β` contains an `α` and a `β`.
  Construct a pair with `(a, b)` or `⟨a, b⟩`; read its components
  with `p.1` and `p.2`. For example, `(7, "seven")` has type
  `Nat × String`.

  You can also use `(α : Type)` for explicit type arguments
  and `[inst : BEq α]` for type class arguments.

  TODO: Implement these polymorphic functions.
-/

-- Return the first element of a pair
def myFst {α β : Type} (p : α × β) : α := sorry

-- Swap the elements of a pair
def mySwap {α β : Type} (p : α × β) : β × α := sorry

-- Apply a function to both elements of a pair
def mapPair {α β γ : Type} (f : α → γ) (g : β → γ) (p : α × β) : γ × γ := sorry
