import Leanlings.Exercise

namespace Leanlings.Config

def exercises : Array Exercise := #[
  -- 00_intro
  { name := "intro1", dir := "00_intro",
    hint := "Replace `sorry` with the string \"Hello, Lean!\" (including the quotes).\nIn Lean, strings are written between double quotes: \"like this\"." },
  { name := "intro2", dir := "00_intro",
    hint := "Look at the type annotation after the colon.\nThe definition says `: Nat` which means it should be a natural number,\nbut \"seven\" is a String. Change the value to an actual number." },

  -- 01_basics
  { name := "basics1", dir := "01_basics",
    hint := "Replace `sorry` with the number 42.\n`Nat` is Lean's type for natural numbers (0, 1, 2, ...)." },
  { name := "basics2", dir := "01_basics",
    hint := "Each definition needs a value of the correct type.\n`Nat` values are numbers like 0, 1, 42.\n`String` values are text in quotes like \"hello\".\n`Bool` values are `true` or `false`." },
  { name := "basics3", dir := "01_basics",
    hint := "Use `++` to concatenate strings in Lean.\nFor example: \"Hello, \" ++ \"world!\" produces \"Hello, world!\"." },
  { name := "basics4", dir := "01_basics",
    hint := "Boolean operators in Lean:\n`&&` is logical AND\n`||` is logical OR\n`!` is logical NOT\n`true && false` evaluates to `false`." },

  -- 02_definitions
  { name := "defs1", dir := "02_definitions",
    hint := "Use `#eval` in your editor to compute the answers.\n`#eval 2 ^ 10` will show 1024.\n`#eval \"hello\".length` will show 5.\n`#eval (List.range 5).length` will show 5." },
  { name := "defs2", dir := "02_definitions",
    hint := "A function definition lists parameters before the return type:\n`def name (param : ParamType) : ReturnType := body`\nFor example: `def inc (n : Nat) : Nat := n + 1`" },
  { name := "defs3", dir := "02_definitions",
    hint := "Use `let` to create local bindings:\n  let x := 5\n  let y := x + 1\n  y * 2\nThe final expression is the return value." },

  -- 03_functions
  { name := "functions1", dir := "03_functions",
    hint := "Define the function body using the parameter.\nTo triple a number: `n + n + n` or `n * 3` or `3 * n`." },
  { name := "functions2", dir := "03_functions",
    hint := "With multiple parameters, use both in the body:\n`def f (a : Nat) (b : Nat) : Nat := a + b`" },
  { name := "functions3", dir := "03_functions",
    hint := "Anonymous functions use `fun`:\n`fun x => x + 1`\n`fun x y => x * y`\nThey work just like named functions but without a name." },
  { name := "functions4", dir := "03_functions",
    hint := "`.map f` applies function `f` to every element of a list.\n`.filter p` keeps only elements where predicate `p` is true.\nExample: `[1,2,3].map (· * 2)` gives `[2,4,6]`.\nThe `·` is shorthand for the argument." },

  -- 04_control_flow
  { name := "if1", dir := "04_control_flow",
    hint := "The `if/then/else` expression in Lean:\n`if condition then value1 else value2`\nBoth branches must return the same type.\nFor absolute value, check if the number is negative." },
  { name := "if2", dir := "04_control_flow",
    hint := "You can chain `if/then/else`:\n`if c1 then a else if c2 then b else c`\nFor classifying, check each condition in order." },
  { name := "match1", dir := "04_control_flow",
    hint := "Pattern matching on `Option`:\nmatch opt with\n| some val => ... -- when there is a value\n| none => ...     -- when there is no value" },

  -- 05_structures
  { name := "structs1", dir := "05_structures",
    hint := "Create instances with named fields:\n  { name := \"Alice\", age := 30 }\nOr with the anonymous constructor:\n  ⟨\"Alice\", 30⟩\nFields must be given in the order they appear in the structure." },
  { name := "structs2", dir := "05_structures",
    hint := "Access structure fields with dot notation: `point.x`\nYou can use them in computations: `p.x + p.y`" },
  { name := "structs3", dir := "05_structures",
    hint := "When a field has a default value, you can omit it when constructing.\n`{ red := 255 }` sets red to 255, green and blue use their defaults (0).\n`{}` uses all defaults. `{ red := 255, green := 255, blue := 255 }` sets all." },

  -- 06_inductive
  { name := "inductive1", dir := "06_inductive",
    hint := "Use pattern matching (equation-style or `match`):\ndef opposite : Direction → Direction\n  | .north => .south\n  | .south => .north\n  | ...\nThe `.` prefix works when the expected type is known." },
  { name := "inductive2", dir := "06_inductive",
    hint := "Pattern match to extract data from constructors:\nmatch r with\n| .ok v => v         -- extract the value\n| .error _ => default -- use underscore to ignore data" },
  { name := "inductive3", dir := "06_inductive",
    hint := "For `isNum`, match on `.num _` and use a wildcard `_` for all other cases.\nFor `sampleExpr`, build it with constructors:\n  .mul (.add (.num 2) (.num 3)) (.num 4)" },

  -- 07_recursion
  { name := "recursion1", dir := "07_recursion",
    hint := "For recursion on `Nat`, handle base and recursive case:\ndef factorial : Nat → Nat\n  | 0 => 1\n  | n + 1 => (n + 1) * factorial n\nLean requires structurally decreasing recursion." },
  { name := "recursion2", dir := "07_recursion",
    hint := "For recursion on `List`, match on `[]` and `head :: tail`:\ndef sum : List Nat → Nat\n  | [] => 0\n  | h :: t => h + sum t" },
  { name := "recursion3", dir := "07_recursion",
    hint := "Use a `where` clause to define a helper with an accumulator.\nThe accumulator builds up the result as you recurse.\nFor reverse: prepend each head to the accumulator." },

  -- 08_propositions
  { name := "props1", dir := "08_propositions",
    hint := "`True` is proved by `True.intro` or `trivial`.\n`rfl` proves any goal of the form `a = a` (reflexivity).\nThese are the simplest proofs in Lean." },
  { name := "props2", dir := "08_propositions",
    hint := "For `A ∧ B` (And), provide both proofs: `⟨proof_a, proof_b⟩` or `And.intro ha hb`.\nFor `A ∨ B` (Or), provide one side: `Or.inl proof_a` or `Or.inr proof_b`." },
  { name := "props3", dir := "08_propositions",
    hint := "`¬P` is defined as `P → False`.\nTo prove it, assume P and derive a contradiction.\nImplication `A → B` is proved by `fun (h : A) => ...proof of B...`.\n`absurd h hn` derives anything from `h : P` and `hn : ¬P`." },

  -- 09_tactics
  { name := "tactics1", dir := "09_tactics",
    hint := "`intro h` introduces a hypothesis from the goal.\nIf the goal is `A → B`, after `intro ha`, you have `ha : A` and goal `B`.\n`exact term` closes the goal when `term` has exactly the right type." },
  { name := "tactics2", dir := "09_tactics",
    hint := "`apply f` works backwards from the goal.\n`constructor` splits `A ∧ B` into two subgoals.\nFor `h : P ∧ Q`, use `h.left` (or `h.1`) for P and `h.right` (or `h.2`) for Q." },
  { name := "tactics3", dir := "09_tactics",
    hint := "`rw [h]` rewrites the goal using equation `h : a = b`.\nIt replaces `a` with `b` in the goal.\n`rw [← h]` rewrites backwards (replaces `b` with `a`)." },
  { name := "tactics4", dir := "09_tactics",
    hint := "`simp` simplifies using known lemmas.\n`omega` solves linear arithmetic over Nat and Int.\n`decide` proves decidable propositions by evaluation.\nTry `omega` for numeric goals and `simp` for simplification." },

  -- 10_induction
  { name := "induction1", dir := "10_induction",
    hint := "`myAdd_zero` is true by definition — try `rfl`.\nFor `myAdd_zero_left`, use `induction n with`:\n| zero => rfl\n| succ n ih => simp [myAdd, ih]\nThe `ih` (induction hypothesis) gives you `myAdd 0 n = n`." },
  { name := "induction2", dir := "10_induction",
    hint := "Use `induction l1 with` to get two cases.\nIn the `nil` case, try `simp [myLength]`.\nIn the `cons` case, try `simp [myLength, ih, Nat.add_assoc]`." },

  -- 11_typeclasses
  { name := "typeclasses1", dir := "11_typeclasses",
    hint := "Type classes provide overloaded behavior.\n`ToString` requires implementing `toString : α → String`.\nUse pattern matching to return a different string for each constructor." },
  { name := "typeclasses2", dir := "11_typeclasses",
    hint := "Define an instance with:\ninstance : ClassName MyType where\n  methodName := implementation\nFor `BEq`, implement `beq` using pattern matching.\nFor `Describable`, implement `describe` similarly." },

  -- 12_quiz
  { name := "quiz1", dir := "12_quiz",
    hint := "This combines structures, recursion, and proofs.\n`manhattan`: use `if p.x >= q.x then p.x - q.x else q.x - p.x` for each axis.\n`countIf`: recurse on the list, add 1 when the predicate is true.\n`manhattan_self`: try `simp [manhattan]`." },

  -- 13_do_notation
  { name := "do1", dir := "13_do_notation",
    hint := "Use `do` notation to chain Option operations:\ndo\n  let x ← safeDivide 100 5\n  let y ← safeDivide x 4\n  return y\nFor failingDivide, include a step that divides by zero." },
  { name := "do2", dir := "13_do_notation",
    hint := "Chain the two checks with `do` notation:\ndo\n  let x ← checkPositive n\n  checkSmall x" },
  { name := "do3", dir := "13_do_notation",
    hint := "`Id.run do` runs a pure do block.\nUse `let mut` for mutable variables.\nUse `for x in l do` to iterate.\nUpdate the mutable variable inside the loop." },

  -- 14_io
  { name := "io1", dir := "14_io",
    hint := "Use `IO.println s!\"Hello, {name}!\"` for string interpolation.\nFor main, call `greet` with a name." },
  { name := "io2", dir := "14_io",
    hint := "Use `for i in List.range n do` to loop.\n`List.range n` gives [0, 1, ..., n-1].\nPrint `n - i` to count down from n to 1." },

  -- 15_implicit
  { name := "implicit1", dir := "15_implicit",
    hint := "Use `p.1` for the first element of a pair, `p.2` for the second.\nFor mySwap: `(p.2, p.1)`. For mapPair: `(f p.1, g p.2)`." },
  { name := "implicit2", dir := "15_implicit",
    hint := "For `myContains`: recurse on the list, check `x == h` at each step.\nFor `myDedup`: recurse on the list, only keep `h` if it's not already in the tail's result." },

  -- 16_arrays
  { name := "arrays1", dir := "16_arrays",
    hint := "Use `.map (· * 2)` to double elements.\nUse `.foldl (· + ·) 0` to sum.\nUse `.filter (· > threshold)` to filter." },
  { name := "arrays2", dir := "16_arrays",
    hint := "For squares, use `Id.run do` with a `for` loop and `a.push`.\nFor myReverse, iterate and build a new array in reverse order." },

  -- 17_namespaces
  { name := "ns1", dir := "17_namespaces",
    hint := "`square n` returns `n * n`, `cube n` returns `n * n * n`.\nFor sumOfPowers, use `open MyMath in` before the definition body." },
  { name := "ns2", dir := "17_namespaces",
    hint := "myElem: match on the list, check `x == h || myElem x t`.\nmyRemoveAll: match on list, keep `h` only if `!(x == h)`." },

  -- 18_exists
  { name := "exists1", dir := "18_exists",
    hint := "Provide a witness and proof: `⟨6, by omega⟩`.\nFor exists_greater, `⟨n + 1, by omega⟩` works." },
  { name := "exists2", dir := "18_exists",
    hint := "Use `let ⟨w, hw⟩ := h` to extract the witness and proof.\nThen construct the new existential with `exact ⟨witness, proof⟩`." },

  -- 19_cases_have
  { name := "cases1", dir := "19_cases_have",
    hint := "Use `cases h with | intro left right => ...` for And.\nUse `cases h with | inl ha => ... | inr hb => ...` for Or." },
  { name := "have1", dir := "19_cases_have",
    hint := "Use `have hq := hpq hp` to establish intermediate facts.\nFor double_neg: `intro hn; exact hn hp`." },
  { name := "cases2", dir := "19_cases_have",
    hint := "For zero_or_pos: `cases n` gives zero and succ cases.\nFor bool_and_comm: `cases a <;> cases b <;> rfl` or use `decide`." },

  -- 20_calc
  { name := "calc1", dir := "20_calc",
    hint := "Use `calc a _ = b := by rw [h1] _ = c := by rw [h2]`.\nOr just use `omega` for arithmetic goals." },
  { name := "calc2", dir := "20_calc",
    hint := "For inequalities, `omega` handles most goals.\nYou can also chain: `calc a _ ≤ b := h1 _ ≤ c := h2`." },

  -- 21_classical
  { name := "classical1", dir := "21_classical",
    hint := "`Classical.em P` gives `P ∨ ¬P`.\nFor dne: use `Classical.byContradiction` — assume ¬P and derive False from h.\nOr: `by_contra hn; exact h hn`." },
  { name := "classical2", dir := "21_classical",
    hint := "Constructive direction: `intro hnq hp; exact hnq (h hp)`.\nClassical direction: `cases Classical.em Q` to split on whether Q holds." },

  -- 22_nat_proofs
  { name := "nat1", dir := "22_nat_proofs",
    hint := "`omega` proves all linear arithmetic over Nat.\nAlternatively, use `exact Nat.add_comm a b` for commutativity." },
  { name := "nat2", dir := "22_nat_proofs",
    hint := "All of these are linear arithmetic — `omega` solves them.\nAlternatively, use Nat.le_trans, Nat.le_antisymm, etc." },
  { name := "nat3", dir := "22_nat_proofs",
    hint := "For sumTo_formula: use `induction n`, then `simp [sumTo]` for the base case.\nThe inductive step needs `rw [Nat.mul_add, ih]` then commutativity lemmas.\nFor sumTo_mono: `simp [sumTo]` closes it directly." },

  -- 23_list_proofs
  { name := "list1", dir := "23_list_proofs",
    hint := "`simp` knows standard list lemmas.\nAlternatively, `induction l with` and `simp` in each case." },
  { name := "list2", dir := "23_list_proofs",
    hint := "`simp` handles map_length, map_id, and reverse_length.\nFor map_id you might need `simp [Function.id_def]` or `induction`." },
  { name := "list3", dir := "23_list_proofs",
    hint := "All three need `induction` on the first list argument.\nUse `simp [myAppend]` in each case.\nFor myAppend_eq_append, the base and cons cases unfold to list equalities." },

  -- 24_final_quiz
  { name := "quiz2", dir := "24_final_quiz",
    hint := "Tree.size: leaf => 0, node l _ r => 1 + l.size + r.size.\nTree.toList: leaf => [], node l v r => l.toList ++ [v] ++ r.toList.\nProofs: try `rfl` or `simp [Tree.size, Tree.toList]`." }
]

def getExercise (name : String) : Option Exercise :=
  exercises.find? (·.name == name)

def welcomeMessage : String :=
  "Welcome to Leanlings!\n\n" ++
  "Leanlings will teach you Lean 4 through small exercises.\n\n" ++
  "Here's how it works:\n" ++
  "1. Each exercise is a Lean file with something to fix\n" ++
  "2. Open the file in your editor and follow the instructions\n" ++
  "3. Run `lake exe leanlings run` to check your solution\n" ++
  "4. Run `lake exe leanlings next` to advance\n\n" ++
  "Or use `lake exe leanlings watch` for auto-checking!\n"

def finalMessage : String :=
  "Congratulations! You've completed all Leanlings exercises!\n\n" ++
  "You now have a solid foundation in Lean 4, including:\n" ++
  "  - Basic types, definitions, and functions\n" ++
  "  - Control flow and pattern matching\n" ++
  "  - Structures and inductive types\n" ++
  "  - Recursion\n" ++
  "  - Propositions and proofs\n" ++
  "  - Tactic-based proving and induction\n" ++
  "  - Type classes\n" ++
  "  - Do notation and IO\n" ++
  "  - Implicit arguments, arrays, and namespaces\n" ++
  "  - Existential and classical logic\n" ++
  "  - Calculational proofs\n" ++
  "  - Proving properties of Nat and List\n\n" ++
  "Keep exploring! Check out:\n" ++
  "  - Theorem Proving in Lean 4: https://lean-lang.org/theorem_proving_in_lean4/\n" ++
  "  - Functional Programming in Lean: https://lean-lang.org/functional_programming_in_lean/\n" ++
  "  - Mathematics in Lean: https://leanprover-community.github.io/mathematics_in_lean/\n"

end Leanlings.Config
