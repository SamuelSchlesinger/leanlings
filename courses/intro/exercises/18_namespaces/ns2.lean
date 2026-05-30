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

-- Don't change below this line!
#guard myElem 3 [1, 2, 3] == true
#guard myElem 4 [1, 2, 3] == false
#guard myElem 1 ([] : List Nat) == false
#guard myRemoveAll 2 [1, 2, 3, 2, 4] == [1, 3, 4]
#guard myRemoveAll 5 [1, 2, 3] == [1, 2, 3]
