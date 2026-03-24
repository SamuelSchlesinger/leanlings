/- # Structures 3: Default Values

  Structure fields can have default values:

    structure Config where
      width : Nat := 80
      height : Nat := 24

  You can omit defaulted fields when constructing:
    let c : Config := {}              -- all defaults
    let c : Config := { width := 120 } -- override one

  `deriving Repr` after the fields lets you print with `#eval`.

  TODO: Create RGBColor instances using defaults.
-/

structure RGBColor where
  red : Nat := 0
  green : Nat := 0
  blue : Nat := 0
  deriving Repr, BEq

-- Pure red: red=255, green and blue use defaults
def pureRed : RGBColor := sorry

-- White: all channels at 255
def white : RGBColor := sorry

-- Black: use all defaults
def black : RGBColor := sorry

-- Don't change below this line!
#guard pureRed.red == 255
#guard pureRed.green == 0
#guard white == { red := 255, green := 255, blue := 255 : RGBColor }
#guard black == ({} : RGBColor)
