inductive Suit where
  | hearts
  | diamonds
  | clubs
  | spades
  deriving Repr

class Describable (α : Type) where
  describe : α → String

instance : BEq Suit where
  beq
    | .hearts, .hearts     => true
    | .diamonds, .diamonds => true
    | .clubs, .clubs       => true
    | .spades, .spades     => true
    | _, _                 => false

instance : Describable Suit where
  describe
    | .hearts   => "Hearts"
    | .diamonds => "Diamonds"
    | .clubs    => "Clubs"
    | .spades   => "Spades"
