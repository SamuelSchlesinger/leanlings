-- Hidden correctness checks for this exercise (not shown to the learner).
#guard (Suit.hearts == Suit.hearts) == true
#guard (Suit.hearts == Suit.diamonds) == false
#guard (Suit.clubs == Suit.spades) == false
open Describable in
#guard (describe Suit.hearts).length > 0
open Describable in
#guard (describe Suit.diamonds).length > 0

