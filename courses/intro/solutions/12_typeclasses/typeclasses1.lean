inductive Color where
  | red
  | green
  | blue
  deriving Repr, BEq

instance : ToString Color where
  toString
    | .red   => "red"
    | .green => "green"
    | .blue  => "blue"
