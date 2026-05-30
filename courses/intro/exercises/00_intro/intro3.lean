/- # Intro 3: Reading Error Messages

  When your code has a problem, Lean tells you what went wrong.
  Learning to read these messages is an essential skill!

  Each definition below has an error. Your editor will underline
  the problem — hover over it to see the message, or run
  `lake exe leanlings run` to see it in the terminal.

  Common errors:
  • "type mismatch" — the value doesn't match the expected type
  • "unknown identifier" — you used a name that doesn't exist
  • "function expected" — you tried to call a non-function

  TODO: Fix each definition so the file compiles.
-/

-- Error: "type mismatch" — "yes" is a String, but Bool is expected.
-- Fix: change the value to a Bool.
def isReady : Bool := "yes"

-- Error: "type mismatch" — true is a Bool, but Nat is expected.
-- Fix: change the value to a Nat.
def count : Nat := true

-- Error: "type mismatch" — "hello" is a String, but Nat is expected.
-- Fix: this time, change the TYPE annotation to match the value.
def message : Nat := "hello"

-- Don't change below this line!
#guard isReady == true
#guard count > 0
#guard message == "hello"
