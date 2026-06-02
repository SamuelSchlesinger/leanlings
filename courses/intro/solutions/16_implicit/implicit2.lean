def myContains [BEq α] (x : α) (l : List α) : Bool :=
  match l with
  | []     => false
  | h :: t => h == x || myContains x t

def myDedup [BEq α] (l : List α) : List α :=
  match l with
  | []     => []
  | h :: t => if myContains h t then myDedup t else h :: myDedup t
