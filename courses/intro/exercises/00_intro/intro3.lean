/- # Intro 3: Reading Error Messages

  Practice reading a type mismatch one definition at a time.
  In each error, find the type of the value you supplied and the
  type Lean expected. Then use the task to decide what to change.

  A new type here is `Bool`: its two values are `true` and `false`.
  Neither value has quotes. The text "true" would be a `String`.

  TODO: Keep all three names, and make these definitions satisfy
  the requirements below:
  - `isReady` has type `Bool` and equals `true`.
  - `count` has type `Nat` and is greater than zero.
  - `message` has type `String` and equals "hello".

  Fix the first definition, check again, and then move to the next.
  The first two need a new value; the last needs a new type annotation.
-/

-- Error: "type mismatch" — "yes" is a String, but Bool is expected.
-- Fix: change the value to a Bool. The two Bool values are `true` and
--      `false` — pick the one that means "yes".
def isReady : Bool := "yes"

-- Error: "type mismatch" — true is a Bool, but Nat is expected.
-- Fix: change the value to a Nat greater than zero (say, 1).
def count : Nat := true

-- Error: "type mismatch" — "hello" is a String, but Nat is expected.
-- Fix: this time, change the TYPE annotation to match the value.
def message : Nat := "hello"
