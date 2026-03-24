section
  variable {α : Type} [BEq α]

  def myElem (x : α) : List α → Bool
    | []     => false
    | h :: t => h == x || myElem x t

  def myRemoveAll (x : α) : List α → List α
    | []     => []
    | h :: t => if h == x then myRemoveAll x t else h :: myRemoveAll x t
end
