theorem obvious : True := True.intro

theorem one_plus_one : 1 + 1 = 2 := rfl

theorem hello_lean : "Hello, " ++ "Lean!" = "Hello, Lean!" := rfl

theorem false_implies_anything (h : False) : 2 + 2 = 5 := nomatch h
