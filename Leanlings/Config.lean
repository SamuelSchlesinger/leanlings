import Leanlings.Exercise

namespace Leanlings.Config

def exercises : Array Exercise := #[
  -- 00_intro
  { name := "intro1", dir := "00_intro",
    hint := "In Lean, strings are written between double quotes, like \"hello\".\nWhat string does the #guard check for?" },
  { name := "intro2", dir := "00_intro",
    hint := "Look at the type after the colon — it says `Nat` (natural number).\nWhat kind of value is \"seven\"? Change it to match the type." },
  { name := "intro3", dir := "00_intro",
    hint := "Read each error message carefully. It tells you what Lean expected\nvs. what it got. Fix each value or type to resolve the mismatch." },

  -- 01_basics
  { name := "basics1", dir := "01_basics",
    hint := "Lean supports arithmetic operators: +, -, *, /, ^.\nCan you write expressions that evaluate to the right values?\nTry `#eval 6 * 7` in your editor to check." },
  { name := "basics2", dir := "01_basics",
    hint := "Each type needs a value of that type:\n`Nat` → numbers like 0, 1, 42\n`String` → text in quotes like \"hello\"\n`Bool` → true or false\nMake sure your string isn't empty!" },
  { name := "basics3", dir := "01_basics",
    hint := "Use `++` to concatenate strings: \"Hello, \" ++ \"Lean!\".\nUse `s!\"...{variable}...\"` for string interpolation." },
  { name := "basics4", dir := "01_basics",
    hint := "Boolean operators combine Bool values.\nWhat does AND (&&) do? What does OR (||) do? What does NOT (!) do?\nThink through the truth table." },

  -- 02_definitions
  { name := "defs1", dir := "02_definitions",
    hint := "Use `#eval` in your editor to compute values.\nFor example, try `#eval 2 ^ 10` to see what it gives." },
  { name := "defs2", dir := "02_definitions",
    hint := "A function takes parameters before the return type.\nWhat expression using the parameter gives the right result?" },
  { name := "defs3", dir := "02_definitions",
    hint := "The `let` keyword creates a local name for a value.\nThe final expression in the block is what gets returned." },

  -- 03_functions
  { name := "functions1", dir := "03_functions",
    hint := "How would you multiply a number by 3? There are several ways." },
  { name := "functions2", dir := "03_functions",
    hint := "Use both parameters in the function body to compute the result." },
  { name := "functions3", dir := "03_functions",
    hint := "Anonymous functions start with `fun`, followed by parameters, then `=>`.\nFor example: `fun x => x + 1`." },
  { name := "functions4", dir := "03_functions",
    hint := "`.map` applies a function to each element.\n`.filter` keeps elements matching a predicate.\n`.foldl f init` combines elements: `foldl (· + ·) 0` sums a list.\nThe `·` shorthand represents the argument." },

  -- 04_control_flow
  { name := "if1", dir := "04_control_flow",
    hint := "`if/then/else` in Lean: `if condition then value1 else value2`.\nBoth branches must return the same type.\nWhat condition distinguishes negative from non-negative numbers?" },
  { name := "if2", dir := "04_control_flow",
    hint := "You can chain `if/then/else`.\nCheck each condition in order from most specific to most general." },
  { name := "match1", dir := "04_control_flow",
    hint := "`Option` has two constructors: `some val` and `none`.\nMatch on both cases and handle them differently." },

  -- 05_structures
  { name := "structs1", dir := "05_structures",
    hint := "Create a struct with `{ fieldName := value, ... }` syntax.\nWhat fields does the structure have?" },
  { name := "structs2", dir := "05_structures",
    hint := "Access fields with dot notation: `p.firstName`, `p.age`.\nFor `birthday`, use update syntax: `{ p with age := ... }`." },
  { name := "structs3", dir := "05_structures",
    hint := "When a field has a default value, you can omit it.\nWhat happens if you omit all fields? What about overriding just one?" },

  -- 06_inductive
  { name := "inductive1", dir := "06_inductive",
    hint := "Pattern match on each constructor.\nThe `.` prefix (like `.north`) works when Lean knows the expected type." },
  { name := "inductive2", dir := "06_inductive",
    hint := "Pattern match to extract data from constructors.\nUse `_` to ignore data you don't need." },
  { name := "inductive3", dir := "06_inductive",
    hint := "For `isNum`, check if the top-level constructor is `.num`.\nFor `sampleExpr`, build the expression tree using the constructors." },

  -- 07_recursion
  { name := "recursion1", dir := "07_recursion",
    hint := "Every recursive function on Nat needs two cases:\n• base case (0): what should it return?\n• recursive case (n+1): how does it relate to the result for n?\nLean requires structurally decreasing recursion." },
  { name := "recursion2", dir := "07_recursion",
    hint := "Recursion on List also needs two cases:\n• empty list []: what's the base value?\n• head :: tail: how do you combine the head with the recursive result?" },
  { name := "recursion3", dir := "07_recursion",
    hint := "The accumulator starts empty and builds up the result.\nFor reversing, what should you do with each head element?" },
  { name := "recursion4", dir := "07_recursion",
    hint := "Match on each constructor: `.num n`, `.add a b`, `.mul a b`.\nFor recursive constructors, call the function on each sub-expression.\nThis is structural recursion — every call is on a smaller piece." },

  -- 08_proving_code
  { name := "proving1", dir := "08_proving_code",
    hint := "`rfl` proves that two expressions are equal when they\ncompute to the same value. Just try it!" },
  { name := "proving2", dir := "08_proving_code",
    hint := "For concrete values, `rfl` works. For variables, try\n`simp [functionName]` to unfold the definition,\nthen `omega` for arithmetic." },
  { name := "proving3", dir := "08_proving_code",
    hint := "`simp [f]` unfolds function `f`. `omega` handles arithmetic\non natural numbers. Try combining them: `simp [f]; omega`." },

  -- 09_propositions
  { name := "props1", dir := "09_propositions",
    hint := "`True.intro` proves `True`. `rfl` proves `a = a`.\nBoth are simple — just provide the right proof term." },
  { name := "props2", dir := "09_propositions",
    hint := "For `A ∧ B`, provide both proofs with `⟨proof_a, proof_b⟩`.\nFor `A ∨ B`, choose one side with `Or.inl` or `Or.inr`." },
  { name := "props3", dir := "09_propositions",
    hint := "A proof of `A → B` is a function: `fun (h : A) => ...proof of B...`.\nNegation `¬A` means `A → False`.\n`absurd h hn` derives anything from `h : P` and `hn : ¬P`." },

  -- 10_tactics
  { name := "tactics1", dir := "10_tactics",
    hint := "`intro` moves a hypothesis from the goal into your context.\n`exact` closes the goal with a term of the right type.\nStart with `intro`, end with `exact`." },
  { name := "tactics2", dir := "10_tactics",
    hint := "`apply f` works backwards from the goal.\n`constructor` splits `A ∧ B` into two subgoals.\nUse `h.left` and `h.right` (or `h.1`, `h.2`) for conjunction parts." },
  { name := "tactics3", dir := "10_tactics",
    hint := "`rw [h]` replaces the left side of `h` with the right side in your goal.\n`rw [← h]` goes the other direction." },
  { name := "tactics4", dir := "10_tactics",
    hint := "Try the most powerful tactic for each goal:\n`omega` for arithmetic, `simp` for simplification,\n`decide` for finite/decidable propositions." },

  -- 11_induction
  { name := "induction1", dir := "11_induction",
    hint := "The first theorem is true by definition — try `rfl`.\nFor the second, use `induction n with`, then handle the\n`zero` and `succ` cases separately." },
  { name := "induction2", dir := "11_induction",
    hint := "Induct on the first list. In each case, try `simp [myLength]`\nand use the induction hypothesis." },

  -- 12_typeclasses
  { name := "typeclasses1", dir := "12_typeclasses",
    hint := "Implement `toString` by pattern matching on each constructor.\nReturn a descriptive string for each one." },
  { name := "typeclasses2", dir := "12_typeclasses",
    hint := "`beq` should return `true` when both values are the same\nconstructor, `false` otherwise. Use nested pattern matching." },

  -- 13_quiz
  { name := "quiz1", dir := "13_quiz",
    hint := "This quiz has no hints — read each comment carefully.\nYou have all the tools: structs, inductives, pattern matching,\nrecursion, higher-order functions, typeclasses, and tactic proofs." },

  -- 14_do_notation
  { name := "do1", dir := "14_do_notation",
    hint := "Use `←` to extract values from Option in a `do` block.\nIf any step returns `none`, the whole block returns `none`." },
  { name := "do2", dir := "14_do_notation",
    hint := "Chain the two checks with `do` notation.\nThe `←` operator short-circuits on `none`." },
  { name := "do3", dir := "14_do_notation",
    hint := "Use `let mut` for a mutable variable,\n`for x in list do` for iteration,\nand `return` for the final value." },

  -- 15_io
  { name := "io1", dir := "15_io",
    hint := "`s!\"text {variable} text\"` is string interpolation.\n`IO.println` prints a line to the console." },
  { name := "io2", dir := "15_io",
    hint := "`List.range n` gives `[0, 1, ..., n-1]`.\nUse a `for` loop to iterate over it and print." },

  -- 16_implicit
  { name := "implicit1", dir := "16_implicit",
    hint := "`p.1` is the first element of a pair, `p.2` is the second.\nUse them to build the return value." },
  { name := "implicit2", dir := "16_implicit",
    hint := "Recurse on the list. At each step, check the head\nagainst the target using `==`." },

  -- 17_arrays
  { name := "arrays1", dir := "17_arrays",
    hint := "`.map` transforms each element. `.foldl` combines elements\nleft-to-right with an accumulator. `.filter` keeps elements\nmatching a predicate." },
  { name := "arrays2", dir := "17_arrays",
    hint := "Use `Id.run do` with a `for` loop and `Array.push`\nto build the result array." },

  -- 18_namespaces
  { name := "ns1", dir := "18_namespaces",
    hint := "Define functions inside the namespace.\nUse `open MyMath in` before the definition body to access\nthem without the namespace prefix." },
  { name := "ns2", dir := "18_namespaces",
    hint := "Recurse on the list. Check each head element against the target." },

  -- 19_quiz2
  { name := "quiz2", dir := "19_quiz2",
    hint := "Combine `do` notation, mutable loops, and polymorphic functions.\nEach uses techniques from the last few modules." },

  -- 20_exists
  { name := "exists1", dir := "20_exists",
    hint := "Provide a witness and proof with `⟨witness, proof⟩`.\nFor `exists_greater`, what number is always greater than `n`?" },
  { name := "exists2", dir := "20_exists",
    hint := "Extract the witness and proof with `let ⟨w, hw⟩ := h`.\nIn tactic mode: `cases h with | intro w hw => ...`" },

  -- 21_cases_have
  { name := "cases1", dir := "21_cases_have",
    hint := "For `And`, `cases` gives you both components.\nFor `Or`, `cases` gives you two branches — one for each side." },
  { name := "have1", dir := "21_cases_have",
    hint := "`have` introduces an intermediate fact:\n`have name := proof`. Build up to the final result step by step." },
  { name := "cases2", dir := "21_cases_have",
    hint := "`cases` on a Nat gives `zero` and `succ`.\n`cases` on a Bool gives `true` and `false`.\nTry `<;>` to apply a tactic to all resulting goals." },

  -- 22_calc
  { name := "calc1", dir := "22_calc",
    hint := "Use `rw [h]` to rewrite with a hypothesis.\nFor the first theorem, the calc skeleton is given — fill in the steps.\nFor the second, write a calc chain: `calc f 5 _ = ... := by rw [h1] ...`" },
  { name := "calc2", dir := "22_calc",
    hint := "For the first theorem, fill in `exact h1` and `exact h2`.\nFor the others, write a calc chain yourself.\nUse `exact h` for inequalities and `rw [h]` for equalities." },

  -- 23_classical
  { name := "classical1", dir := "23_classical",
    hint := "`Classical.em` gives `P ∨ ¬P` for any proposition.\n`Classical.byContradiction` assumes `¬P` and derives `P` from `False`." },
  { name := "classical2", dir := "23_classical",
    hint := "For the constructive direction, use the hypothesis directly.\nFor the classical direction, use `Classical.em` to case-split." },

  -- 24_nat_proofs
  { name := "nat1", dir := "24_nat_proofs",
    hint := "These are properties of addition on natural numbers.\nTry `omega`, or use named lemmas like `Nat.add_comm`." },
  { name := "nat2", dir := "24_nat_proofs",
    hint := "`omega` handles linear arithmetic inequalities.\nAlternatively, use lemmas from the `Nat` namespace." },
  { name := "nat3", dir := "24_nat_proofs",
    hint := "Use `induction` for `sumTo_formula`. The base case unfolds\ndirectly. The inductive step needs the IH and arithmetic rewriting." },

  -- 25_list_proofs
  { name := "list1", dir := "25_list_proofs",
    hint := "`simp` knows standard list lemmas. Try it first;\nif needed, add `induction`." },
  { name := "list2", dir := "25_list_proofs",
    hint := "`simp` handles `map_length`, `map_id`, and `reverse_length`.\nFor `map_id` you might need `induction`." },
  { name := "list3", dir := "25_list_proofs",
    hint := "Induct on the first list argument.\nIn each case, `simp [myAppend]` unfolds your definition." },

  -- 26_final_quiz
  { name := "quiz3", dir := "26_final_quiz",
    hint := "For functions: recurse on `.leaf` and `.node l v r`.\nFor induction proofs: `induction t` then `simp [f, g, ...]`.\nFor the existential: provide a `⟨witness, proof⟩` pair." }
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
  "  - Proving properties of your code\n" ++
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
  "  - Mathematics in Lean: https://leanprover-community.github.io/mathematics_in_lean/\n" ++
  "  - Mathlib (Lean's math library): https://leanprover-community.github.io/mathlib4_docs/\n"

end Leanlings.Config
