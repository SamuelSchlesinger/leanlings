import Leanlings.Exercise
import Leanlings.Course

namespace Leanlings.Config

private def introExercises : Array Exercise := #[
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

private def introWelcome : String :=
  "Welcome to Leanlings!\n\n" ++
  "Leanlings will teach you Lean 4 through small exercises.\n\n" ++
  "Here's how it works:\n" ++
  "1. Each exercise is a Lean file with something to fix\n" ++
  "2. Open the file in your editor and follow the instructions\n" ++
  "3. Run `lake exe leanlings run` to check your solution\n" ++
  "4. Run `lake exe leanlings next` to advance\n\n" ++
  "Or use `lake exe leanlings watch` for auto-checking!\n"

private def introFinal : String :=
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

/-- The introductory course: programming and proof fundamentals in Lean 4. -/
def intro : Course :=
  mkCourse "intro" "Introduction to Lean 4"
    "Programming and theorem proving fundamentals — 70 exercises across 27 units."
    introExercises (welcome := introWelcome) (final := introFinal)

/-- All available courses, in display order. -/

private def nngExercises : Array Exercise := #[
  -- Tutorial
  { name := "rfl", dir := "Tutorial",
    hint := "In order to use the tactic `rfl` you can enter it in the text box\n  under the goal and hit \"Execute\"." },
  { name := "rw", dir := "Tutorial",
    hint := "First execute `rw [h]` to replace the `y` with `x + 7`." },
  { name := "two_eq_ss0", dir := "Tutorial",
    hint := "Start with `rw [two_eq_succ_one]` to begin to break `2` down into its definition." },
  { name := "rw_backwards", dir := "Tutorial",
    hint := "Try `rw [← one_eq_succ_zero]` to change `succ 0` into `1`." },
  { name := "add_zero", dir := "Tutorial",
    hint := "`rw [add_zero]` will change `b + 0` into `b`." },
  { name := "add_zero2", dir := "Tutorial",
    hint := "Try `rw [add_zero c]`." },
  { name := "succ_eq_add_one", dir := "Tutorial",
    hint := "Start by unravelling the `1`." },
  { name := "twoaddtwo", dir := "Tutorial",
    hint := "`nth_rewrite 2 [two_eq_succ_one]` is I think quicker than `rw [two_eq_succ_one]`." },
  -- Addition
  { name := "zero_add", dir := "Addition",
    hint := "You can start a proof by induction on `n` by typing:\n  `induction n with d hd`." },
  { name := "succ_add", dir := "Addition",
    hint := "You might want to think about whether induction\n  on `a` or `b` is the best idea." },
  { name := "add_comm", dir := "Addition",
    hint := "Induction on `a` or `b` -- it's all the same in this one." },
  { name := "add_assoc", dir := "Addition",
    hint := "Remember that when Lean writes `a + b + c`, it means `(a + b) + c`.\n  If you are not sure where the brackets are in an expression, just hover\n  your cursor over it and look at what gets highlighted. For example,\n  hover over both `+` symbols on the left hand side of the goal and\n  you'll see where the invisible brackets are." },
  { name := "add_right_comm", dir := "Addition",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  -- Multiplication
  { name := "mul_one", dir := "Multiplication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "zero_mul", dir := "Multiplication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "succ_mul", dir := "Multiplication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "mul_comm", dir := "Multiplication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "one_mul", dir := "Multiplication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "two_mul", dir := "Multiplication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "mul_add", dir := "Multiplication",
    hint := "You can do induction on any of the three variables. Some choices\n  are harder to push through than others. Can you do the inductive step in\n  5 rewrites only?" },
  { name := "add_mul", dir := "Multiplication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "mul_assoc", dir := "Multiplication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  -- Power
  { name := "zero_pow_zero", dir := "Power",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "zero_pow_succ", dir := "Power",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "pow_one", dir := "Power",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "one_pow", dir := "Power",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "pow_two", dir := "Power",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "pow_add", dir := "Power",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "mul_pow", dir := "Power",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "pow_pow", dir := "Power",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "add_sq", dir := "Power",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  -- Implication
  { name := "exact", dir := "Implication",
    hint := "The goal in this level is one of our hypotheses. Solve the goal by executing `exact h1`." },
  { name := "exact2", dir := "Implication",
    hint := "You can use `rw [zero_add] at {h}` to rewrite at `{h}` instead\n  of at the goal." },
  { name := "apply", dir := "Implication",
    hint := "Start with `apply h2 at h1`. This will change `h1` to `y = 42`." },
  { name := "succ_inj", dir := "Implication",
    hint := "Let's first get `h` into the form `succ x = succ 3` so we can\n  apply `succ_inj`. First execute `rw [four_eq_succ_three] at h`\n  to change the 4 on the right hand side." },
  { name := "succ_inj2", dir := "Implication",
    hint := "Start with `apply succ_inj` to apply `succ_inj` to the *goal*." },
  { name := "intro", dir := "Implication",
    hint := "Start with `intro h` to assume the hypothesis and call its proof `h`." },
  { name := "intro2", dir := "Implication",
    hint := "Start with `intro h` to assume the hypothesis." },
  { name := "ne", dir := "Implication",
    hint := "Remember that `h2` is a proof of `x = y → False`. Try\n  `apply`ing `h2` either `at h1` or directly to the goal." },
  { name := "zero_ne_one", dir := "Implication",
    hint := "Start with `intro h`." },
  { name := "one_ne_zero", dir := "Implication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "two_add_two_ne_five", dir := "Implication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  -- AdvAddition
  { name := "add_right_cancel", dir := "AdvAddition",
    hint := "Start with induction on `n`." },
  { name := "add_left_cancel", dir := "AdvAddition",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "add_left_eq_self", dir := "AdvAddition",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "add_right_eq_self", dir := "AdvAddition",
    hint := "This state is not provable! Did you maybe use `rw [add_left_eq_self] at h`\n    instead of `apply [add_left_eq_self] at h`? You can complare the two in the inventory." },
  { name := "add_right_eq_zero", dir := "AdvAddition",
    hint := "Here we want to deal with the cases `b = 0` and `b ≠ 0` separately,\n  so start with `cases b with d`." },
  { name := "add_left_eq_zero", dir := "AdvAddition",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  -- LessOrEqual
  { name := "le_refl", dir := "LessOrEqual",
    hint := "The reason `{x} ≤ {x}` is because `{x} = {x} + 0`.\n  So you should start this proof with `use 0`." },
  { name := "zero_le", dir := "LessOrEqual",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "le_succ_self", dir := "LessOrEqual",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "le_trans", dir := "LessOrEqual",
    hint := "Start with `cases {hxy} with a ha`." },
  { name := "le_zero", dir := "LessOrEqual",
    hint := "You want to use `add_right_eq_zero`, which you already\n  proved, but you'll have to start with `symm at` your hypothesis." },
  { name := "le_antisymm", dir := "LessOrEqual",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "or_symm", dir := "LessOrEqual",
    hint := "We don't know whether to go left or right yet. So start with `cases {h} with hx hy`." },
  { name := "le_total", dir := "LessOrEqual",
    hint := "Start with `induction {y} with d hd`." },
  { name := "succ_le_succ", dir := "LessOrEqual",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "le_one", dir := "LessOrEqual",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "le_two", dir := "LessOrEqual",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  -- AdvMultiplication
  { name := "mul_le_mul_right", dir := "AdvMultiplication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "mul_left_ne_zero", dir := "AdvMultiplication",
    hint := "We want to reduce this to a hypothesis `b = 0` and a goal `a * b = 0`,\n  which is logically equivalent but much easier to prove. Remember that `X ≠ 0`\n  is notation for `X = 0 → False`. Click on `Show more help!` if you need hints." },
  { name := "eq_succ_of_ne_zero", dir := "AdvMultiplication",
    hint := "Start with `cases a with d` to do a case split on `a = 0` and `a = succ d`." },
  { name := "one_le_of_ne_zero", dir := "AdvMultiplication",
    hint := "Use the previous lemma with `apply eq_succ_of_ne_zero at ha`." },
  { name := "le_mul_right", dir := "AdvMultiplication",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "mul_right_eq_one", dir := "AdvMultiplication",
    hint := "We want to use `le_mul_right`, but we need a hypothesis `x * y ≠ 0`\n  which we don't have. Yet. Execute `have h2 : x * y ≠ 0` (you can type `≠` with `\\\ne`).\n  You'll be asked to\n  prove it, and then you'll have a new hypothesis which you can apply\n  `le_mul_right` to." },
  { name := "mul_ne_zero", dir := "AdvMultiplication",
    hint := "Start with `apply eq_succ_of_ne_zero at ha` and `... at hb`" },
  { name := "mul_eq_zero", dir := "AdvMultiplication",
    hint := "Start with `have h2 := mul_ne_zero a b`." },
  { name := "mul_left_cancel", dir := "AdvMultiplication",
    hint := "The way to start this proof is `induction b with d hd generalizing c`." },
  { name := "mul_right_eq_self", dir := "AdvMultiplication",
    hint := "Reduce to the previous lemma with `nth_rewrite 2 [← mul_one a] at h`" },
  -- Algorithm
  { name := "add_left_comm", dir := "Algorithm",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "add_algo1", dir := "Algorithm",
    hint := "Start with `repeat rw [add_assoc]` to push all the brackets to the right." },
  { name := "add_algo2", dir := "Algorithm",
    hint := "Solve this level in one line with `simp only [add_left_comm, add_comm]`" },
  { name := "add_algo3", dir := "Algorithm",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "pred", dir := "Algorithm",
    hint := "Start with `rw [← pred_succ a]` and take it from there." },
  { name := "succ_ne_zero", dir := "Algorithm",
    hint := "Start with `intro h` (remembering that `X ≠ Y` is just notation\n  for `X = Y → False`)." },
  { name := "succ_ne_succ", dir := "Algorithm",
    hint := "Start with `contrapose! h`, to change the goal into its\n  contrapositive, namely a hypothesis of `succ m = succ n` and a goal of `m = n`." },
  { name := "decide", dir := "Algorithm",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
  { name := "decide2", dir := "Algorithm",
    hint := "Read the explanation at the top of the exercise file, then fill in the proof." },
]

private def nngWelcome : String :=
  "Welcome to the Natural Number Game!\n\n" ++
  "You will build the natural numbers from scratch — starting from `0` and\n" ++
  "`succ` — and prove theorems about addition, multiplication, powers, and\n" ++
  "inequalities, one tactic at a time.\n\n" ++
  "Each exercise file opens with an explanation; replace the `sorry` with a proof,\n" ++
  "then run `lake exe leanlings run` (or use watch mode).\n\n" ++
  "This course is a port of the Natural Number Game by Kevin Buzzard, Mohammad\n" ++
  "Pedramfar and contributors (https://github.com/leanprover-community/NNG4),\n" ++
  "used under the Apache-2.0 license. See courses/nng/NOTICE.\n"

private def nngFinal : String :=
  "Congratulations! You've completed the Natural Number Game port!\n\n" ++
  "You built ℕ from the Peano axioms and proved, among other things:\n" ++
  "  - 0 + n = n, commutativity and associativity of addition\n" ++
  "  - commutativity and associativity of multiplication, distributivity\n" ++
  "  - laws of powers\n" ++
  "  - injectivity of succ and the basic theory of ≤\n\n" ++
  "For the full interactive experience (with the original tactic descriptions and\n" ++
  "the worlds you skipped here), play the original at\n" ++
  "https://adam.math.hhu.de/#/g/leanprover-community/nng4\n"

/-- The Natural Number Game: building ℕ and its basic theory from the Peano
axioms. Ported from leanprover-community/NNG4 (Apache-2.0). -/
def nng : Course :=
  mkCourse "nng" "Natural Number Game"
    "Build ℕ from scratch and prove its basic theory — 78 levels across 9 worlds."
    nngExercises (welcome := nngWelcome) (final := nngFinal)


private def algebraExercises : Array Exercise := #[
  -- Magma
  { name := "bool_and", dir := "Magma",
    hint := "A magma's `*` is just its operation; on `Bool` it is `&&`, and `true && false = false`. Try `rfl`." },
  { name := "bool_comm", dir := "Magma",
    hint := "`Bool` has finitely many values, so `decide` can check every case." },
  { name := "bool_assoc", dir := "Magma",
    hint := "`decide` again — it checks all 8 combinations." },
  -- Semigroup
  { name := "reassoc", dir := "Semigroup",
    hint := "`mul_assoc` turns `x * y * z` into `x * (y * z)`. Apply it twice." },
  { name := "reassoc_back", dir := "Semigroup",
    hint := "`rw [← mul_assoc]` re-associates the other way." },
  { name := "reassoc_pair", dir := "Semigroup",
    hint := "One backward `mul_assoc` does it." },
  { name := "assoc_symm", dir := "Semigroup",
    hint := "`mul_assoc` rewrites the right-hand side." },
  { name := "reassoc5", dir := "Semigroup",
    hint := "Three uses of `mul_assoc`, peeling associativity from the right." },
  { name := "reassoc_mixed", dir := "Semigroup",
    hint := "Re-associate twice." },
  -- Monoid
  { name := "id_unique_left", dir := "Monoid",
    hint := "Apply `h` to `1`, then simplify `e * 1` with `mul_one`." },
  { name := "id_unique_right", dir := "Monoid",
    hint := "Apply `h` to `1`, then simplify `1 * e` with `one_mul`." },
  { name := "one_idempotent", dir := "Monoid",
    hint := "`one_mul` or `mul_one` closes this immediately." },
  { name := "bool_one", dir := "Monoid",
    hint := "The identity of `Bool` under `&&` is `true`, so this is `rfl`." },
  -- Group
  { name := "mul_left_cancel", dir := "Group",
    hint := "Multiply both sides on the left by `a⁻¹`. A `calc` chain through `a⁻¹ * (a * b)` works." },
  { name := "mul_right_cancel", dir := "Group",
    hint := "Mirror of `mul_left_cancel`: multiply on the right by `c⁻¹`." },
  { name := "inv_mul_cancel_left", dir := "Group",
    hint := "Re-associate, then `a⁻¹ * a = 1`." },
  { name := "mul_inv_cancel_left", dir := "Group",
    hint := "Re-associate, then `a * a⁻¹ = 1`." },
  { name := "inv_one", dir := "Group",
    hint := "From `1⁻¹ * 1 = 1`, simplify the left side with `mul_one`." },
  { name := "inv_inv", dir := "Group",
    hint := "`a⁻¹⁻¹` is the inverse of `a⁻¹`; show it equals `a` by inserting `a⁻¹ * a = 1`." },
  { name := "eq_inv_of_mul_eq_one", dir := "Group",
    hint := "Multiply `h` on the left by `a⁻¹`." },
  { name := "inv_eq_of_mul_eq_one", dir := "Group",
    hint := "This is the previous lemma, flipped with `.symm`." },
  { name := "mul_inv_rev", dir := "Group",
    hint := "Show `(a * b) * (b⁻¹ * a⁻¹) = 1`, then use `eq_inv_of_mul_eq_one`. (\"Socks and shoes\".)" },
  { name := "inv_inj", dir := "Group",
    hint := "Apply `inv_inv` to rewrite `a` as `a⁻¹⁻¹`, use `h`, then `inv_inv` again." },
  { name := "inv_mul_cancel_right", dir := "Group",
    hint := "Re-associate, then `b⁻¹ * b = 1`." },
  { name := "eq_of_mul_inv_eq_one", dir := "Group",
    hint := "Multiply by `b` on the right, using `h : a * b⁻¹ = 1`." },
  { name := "mul_eq_one_of_eq_inv", dir := "Group",
    hint := "Substitute `a = b⁻¹`, then `b⁻¹ * b = 1`." },
  { name := "mul_right_eq_self", dir := "Group",
    hint := "Rewrite `a` as `a * 1`, then cancel `a` on the left." },
  { name := "mul_left_eq_self", dir := "Group",
    hint := "Rewrite `b` as `1 * b`, then cancel `b` on the right." },
  { name := "conj_cancel", dir := "Group",
    hint := "Re-associate the trailing `g⁻¹ * g` and collapse it." },
  -- CommGroup
  { name := "mul_inv", dir := "CommGroup",
    hint := "Use `mul_inv_rev`, then commutativity to swap the factors." },
  { name := "mul_left_comm", dir := "CommGroup",
    hint := "Re-associate to expose `a * b`, swap it, then re-associate back." },
  { name := "mul_right_comm", dir := "CommGroup",
    hint := "Re-associate to expose `b * c`, swap it, then re-associate back." },
  { name := "mul_inv_cancel_right", dir := "CommGroup",
    hint := "Re-associate, then `b * b⁻¹ = 1`." },
  { name := "inv_comm", dir := "CommGroup",
    hint := "Direct from commutativity." },
  { name := "mul_mul_mul_comm", dir := "CommGroup",
    hint := "Re-associate to expose `b * c`, commute it, then re-associate back." },
  -- Division
  { name := "div_self", dir := "Division",
    hint := "Unfold `/` with `div_eq`, then `a * a⁻¹ = 1`." },
  { name := "div_one", dir := "Division",
    hint := "Unfold `/`, use `inv_one`, then `mul_one`." },
  { name := "one_div", dir := "Division",
    hint := "Unfold `/`, then `1 * a⁻¹ = a⁻¹`." },
  { name := "mul_div_cancel", dir := "Division",
    hint := "Unfold `/`, re-associate, then `b * b⁻¹ = 1`." },
  { name := "div_mul_cancel", dir := "Division",
    hint := "Unfold `/`, re-associate, then `b⁻¹ * b = 1`." },
  -- Hom
  { name := "map_one", dir := "Hom",
    hint := "`f 1 = f (1 * 1) = f 1 * f 1`, so `f 1` is idempotent; cancel it." },
  { name := "map_inv", dir := "Hom",
    hint := "Show `f a * f a⁻¹ = f (a * a⁻¹) = f 1 = 1`, then use `eq_inv_of_mul_eq_one`." },
  { name := "map_mul_inv", dir := "Hom",
    hint := "Use `map_mul` to split, then `map_inv` on the second factor." },
  { name := "map_div", dir := "Hom",
    hint := "Unfold both `/`s with `div_eq`, then `map_mul` and `map_inv`." },
  -- Ring
  { name := "add_neg_cancel", dir := "Ring",
    hint := "The axiom gives `-a + a = 0`; commute first." },
  { name := "add_left_cancel", dir := "Ring",
    hint := "Add `-a` on the left of both sides — the additive analogue of `mul_left_cancel`." },
  { name := "add_right_cancel", dir := "Ring",
    hint := "Add `-c` on the right; uses `add_neg_cancel`." },
  { name := "zero_mul", dir := "Ring",
    hint := "`0 * a + 0 * a = (0 + 0) * a = 0 * a`, so cancel one copy with `add_left_cancel`." },
  { name := "mul_zero", dir := "Ring",
    hint := "Mirror of `zero_mul`, using `left_distrib`." },
  { name := "neg_mul", dir := "Ring",
    hint := "Both `-a * b` and `-(a * b)` add to `a * b` to give `0`; cancel on the right." },
  { name := "mul_neg", dir := "Ring",
    hint := "Mirror of `neg_mul`, using `left_distrib` and `mul_zero`." },
  { name := "neg_neg", dir := "Ring",
    hint := "`- -a` is the additive inverse of `-a`; the additive analogue of `inv_inv`." },
  { name := "neg_mul_neg", dir := "Ring",
    hint := "Pull both negations out with `neg_mul` and `mul_neg`, then cancel with `neg_neg`." },
  { name := "mul_add_mul", dir := "Ring",
    hint := "Distribute the right factor, then each piece. (No commutativity needed yet.)" },
  { name := "neg_zero", dir := "Ring",
    hint := "From `-0 + 0 = 0`, simplify the left side with `add_zero`." },
  { name := "neg_eq_of_add_eq_zero", dir := "Ring",
    hint := "The additive analogue of `inv_eq_of_mul_eq_one`." },
  { name := "neg_add", dir := "Ring",
    hint := "Additive \"socks and shoes\": show `(a + b) + (-b + -a) = 0`, then use `neg_eq_of_add_eq_zero`." },
  { name := "sub_self", dir := "Ring",
    hint := "Unfold `-` with `sub_eq`, then `a + -a = 0`." },
  { name := "sub_zero", dir := "Ring",
    hint := "Unfold `-`, use `neg_zero`, then `add_zero`." },
  { name := "mul_sub", dir := "Ring",
    hint := "Unfold `-`, distribute, push the negation out with `mul_neg`, then fold `-` back." },
  { name := "sub_mul", dir := "Ring",
    hint := "Unfold `-`, distribute, push the negation out with `neg_mul`, then fold `-` back." },
  -- CommRing
  { name := "mul_rotate", dir := "CommRing",
    hint := "Re-associate, then commute the whole product." },
  { name := "sq_expand", dir := "CommRing",
    hint := "Expand with `mul_add_mul`, then commute the `b * a` term to `a * b`." },
  -- Field
  { name := "mul_inv_cancel", dir := "Field",
    hint := "This is exactly the field axiom for nonzero `a`." },
  { name := "inv_mul_cancel", dir := "Field",
    hint := "Commute, then apply the field axiom." },
  { name := "field_inv_one", dir := "Field",
    hint := "`1 * 1⁻¹ = 1`, and `1 * 1⁻¹ = 1⁻¹`." },
  { name := "inv_ne_zero", dir := "Field",
    hint := "If `a⁻¹ = 0` then `a * a⁻¹ = a * 0 = 0`, contradicting `a * a⁻¹ = 1` (since `0 ≠ 1`)." },
  { name := "mul_ne_zero", dir := "Field",
    hint := "If `a * b = 0` and `a ≠ 0`, multiply by `a⁻¹` to force `b = 0`." },
  { name := "mul_eq_zero", dir := "Field",
    hint := "Case on whether `a = 0`. If not, multiply by `a⁻¹` to get `b = 0`. (Uses classical case analysis.)" },
  { name := "mul_self_eq_zero", dir := "Field",
    hint := "`mul_eq_zero` gives `a = 0 ∨ a = 0`; either branch is `a = 0`." },
  { name := "field_mul_left_cancel", dir := "Field",
    hint := "For nonzero `a`, multiply both sides by `a⁻¹`. (Cancellation needs `a ≠ 0` in a field.)" },
]

private def algebraWelcome : String :=
  "Welcome to Abstract Algebra!\n\n" ++
  "Following Bourbaki, you'll climb the algebraic hierarchy one axiom at a time —\n" ++
  "magma, semigroup, monoid, group, commutative group, then rings and fields —\n" ++
  "proving the basic theory of each from its axioms alone.\n\n" ++
  "Everything is built from scratch in core Lean (no Mathlib): the structures live\n" ++
  "in `AlgebraLib`, and each exercise asks you to prove a theorem that holds in\n" ++
  "*every* structure of that kind. Replace the `sorry` with a proof.\n"

private def algebraFinal : String :=
  "Congratulations! You've climbed the algebraic hierarchy from magmas to fields,\n" ++
  "proving — from the axioms — cancellation, uniqueness and laws of inverses,\n" ++
  "homomorphism properties, the sign rules of rings, and that a field has no zero\n" ++
  "divisors. You now have a working, formal grasp of the Bourbaki tower.\n"

/-- Abstract algebra a la Bourbaki: a from-scratch climb up the algebraic
hierarchy, magmas through fields, proving each level's theory from its axioms. -/
def algebra : Course :=
  mkCourse "algebra" "Abstract Algebra"
    "Climb the Bourbaki hierarchy — magma to field — proving each level from its axioms."
    algebraExercises (welcome := algebraWelcome) (final := algebraFinal)

def courses : Array Course := #[intro, nng, algebra]

/-- The course used when none is selected or a stored selection is invalid. -/
def defaultCourse : Course := intro

/-- Find a course by its id. -/
def getCourse (id : String) : Option Course :=
  courses.find? (·.id == id)

end Leanlings.Config
