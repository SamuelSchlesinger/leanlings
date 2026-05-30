/- # Implicit Arguments 1: Curly Braces

  In Lean, arguments in `{...}` are implicit — Lean infers them:

    def identity {α : Type} (x : α) : α := x

    #check identity 42        -- Nat
    #check identity "hello"   -- String

  Without implicit args, you'd have to write:
    identity Nat 42    -- tedious!

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

-- Don't change below this line!
#guard myFst (1, "hello") == 1
#guard mySwap (1, 2) == (2, 1)
#guard mapPair (· + 1) (· * 2) (3, 4) == (4, 8)
