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

  Note: `α` and `[BEq α]` are automatically added as
  parameters to every definition in the section.

  TODO: Complete the definitions in the section.
-/

section
  variable {α : Type} [BEq α]

  def myElem (x : α) : List α → Bool := sorry

  def myRemoveAll (x : α) : List α → List α := sorry
end
