structure RGBColor where
  red : Nat := 0
  green : Nat := 0
  blue : Nat := 0
  deriving Repr, BEq

def pureRed : RGBColor := { red := 255 }

def white : RGBColor := { red := 255, green := 255, blue := 255 }

def black : RGBColor := {}
