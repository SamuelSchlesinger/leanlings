/- # Namespaces 2: Sections and Variables

  `section` with `variable` lets you avoid repeating parameters:

    section
      variable (α : Type) [BEq α]

      def myContains (x : α) (l : List α) : Bool :=
        match l with
        | [] => false
        | h :: t => h == x || myContains x t

      def myCount (x : α) (l : List α) : Nat :=
        match l with
        | [] => 0
        | h :: t => (if h == x then 1 else 0) + myCount x t
    end

  A declaration includes the section parameters it actually uses,
  including parameters needed by its type or type class instances.
  An unrelated definition such as `def answer : Nat := 42` would
  not acquire `α` or `[BEq α]` just because it is in this section.

  TODO: `myElem x xs` should say whether `x` occurs in `xs`.
  `myRemoveAll x xs` should remove every occurrence of `x`, leaving
  the other elements in their original order.
-/

section
  variable {α : Type} [BEq α]

  def myElem (x : α) : List α → Bool := sorry

  def myRemoveAll (x : α) : List α → List α := sorry
end
