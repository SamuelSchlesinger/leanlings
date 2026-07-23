-- Hidden correctness checks for this exercise (not shown to the learner).
#guard (Suit.hearts == Suit.hearts) == true
#guard (Suit.diamonds == Suit.diamonds) == true
#guard (Suit.clubs == Suit.clubs) == true
#guard (Suit.spades == Suit.spades) == true
#guard (Suit.hearts == Suit.diamonds) == false
#guard (Suit.hearts == Suit.clubs) == false
#guard (Suit.hearts == Suit.spades) == false
#guard (Suit.diamonds == Suit.hearts) == false
#guard (Suit.diamonds == Suit.clubs) == false
#guard (Suit.diamonds == Suit.spades) == false
#guard (Suit.clubs == Suit.hearts) == false
#guard (Suit.clubs == Suit.diamonds) == false
#guard (Suit.clubs == Suit.spades) == false
#guard (Suit.spades == Suit.hearts) == false
#guard (Suit.spades == Suit.diamonds) == false
#guard (Suit.spades == Suit.clubs) == false
open Describable in
#guard describe Suit.hearts == "Hearts"
open Describable in
#guard describe Suit.diamonds == "Diamonds"
open Describable in
#guard describe Suit.clubs == "Clubs"
open Describable in
#guard describe Suit.spades == "Spades"
