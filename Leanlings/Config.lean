import Leanlings.Exercise
import Leanlings.Course

namespace Leanlings.Config

private def introExercises : Array Exercise := #[
  -- 00_intro
  { name := "intro1", dir := "00_intro",
    hint := "A String is text between double quotes, like \"hello\".\nReplace only `sorry` with the greeting requested in the task, including its punctuation." },
  { name := "intro2", dir := "00_intro",
    hint := "Look at the type after the colon — it says `Nat` (natural number).\nWhat kind of value is \"seven\"? Change it to match the type." },
  { name := "intro3", dir := "00_intro",
    hint := "Read each error message carefully. It tells you what Lean expected\nvs. what it got. Fix each value or type to resolve the mismatch." },

  -- 01_basics
  { name := "basics1", dir := "01_basics",
    hint := "Lean supports arithmetic operators: +, -, *, /, ^.\nCan you write expressions that evaluate to the right values?\nTry `#eval 6 * 7` in your editor to check." },
  { name := "basics2", dir := "01_basics",
    hint := "Each type needs a value of that type:\n`Nat` → numbers like 0, 1, 42\n`String` → nonempty text in quotes like \"hello\"\n`Bool` → true or false" },
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
    hint := "The first theorem is true by definition — try `rfl`.\nFor the second, use `induction n with`, then handle the `zero` and `succ`\ncases. In the `succ` case, `unfold myAdd` exposes the recursive equation\n(or use `simp [myAdd]`), then rewrite with the induction hypothesis `ih`." },
  { name := "induction2", dir := "11_induction",
    hint := "Induct on the first list. In each case, try `simp [myLength]`\nand use the induction hypothesis." },

  -- 12_typeclasses
  { name := "typeclasses1", dir := "12_typeclasses",
    hint := "Implement `toString` by pattern matching on each constructor.\nReturn a descriptive string for each one." },
  { name := "typeclasses2", dir := "12_typeclasses",
    hint := "`beq` should return `true` when both values are the same\nconstructor, `false` otherwise. Use nested pattern matching." },

  -- 13_quiz
  { name := "quiz1", dir := "13_quiz",
    hint := "Work through the numbered parts in order. Compare your instance code with unit 12, list processing with units 3 and 7, and induction proofs with unit 11.\nUse `#eval` to inspect a small example before trying to prove a property." },

  -- 14_do_notation
  { name := "do1", dir := "14_do_notation",
    hint := "Use `←` to extract values from Option in a `do` block.\nIf any step returns `none`, the whole block returns `none`." },
  { name := "do2", dir := "14_do_notation",
    hint := "Chain the two checks with `do` notation.\nThe `←` operator short-circuits on `none`." },
  { name := "do3", dir := "14_do_notation",
    hint := "Use `let mut` for a mutable variable,\n`for x in list do` for iteration,\nand `return` for the final value." },

  -- 15_io
  { name := "io1", dir := "15_io",
    hint := "`s!\"text {variable} text\"` is string interpolation.\n`IO.println` prints a line to the console.",
    expectedOutput := some "Hello, Lean!\n" },
  { name := "io2", dir := "15_io",
    hint := "`List.range n` gives `[0, 1, ..., n-1]`.\nUse a `for` loop to iterate over it and print.",
    expectedOutput := some "5\n4\n3\n2\n1\n" },

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
    hint := "Pull the witness out with `let ⟨n, hn⟩ := h`, giving `n` and `hn : P n`.\n  First proof: hand them back with `exact ⟨n, hn⟩`. Second: `n > 0` gives\n  `n + 1 > 1`, so `exact ⟨n + 1, by omega⟩`." },

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
    hint := "The whole proof is `rfl`. It closes any goal of the form `X = X`." },
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
    hint := "Use `nth_rewrite 2 [two_eq_succ_one]` to unfold the second 2 first, so `add_succ` applies." },
  -- Addition
  { name := "zero_add", dir := "Addition",
    hint := "Use `induction n using MyNat.rec' with` and the `zero` / `succ d hd` branches shown in the exercise. The step uses `hd : 0 + d = d`." },
  { name := "succ_add", dir := "Addition",
    hint := "You might want to think about whether induction\n  on `a` or `b` is the best idea." },
  { name := "add_comm", dir := "Addition",
    hint := "Induction on `a` or `b` -- it's all the same in this one." },
  { name := "add_assoc", dir := "Addition",
    hint := "Remember that when Lean writes `a + b + c`, it means `(a + b) + c`.\n  If you are not sure where the brackets are in an expression, just hover\n  your cursor over it and look at what gets highlighted. For example,\n  hover over both `+` symbols on the left hand side of the goal and\n  you'll see where the invisible brackets are." },
  { name := "add_right_comm", dir := "Addition",
    hint := "Reassociate to expose `b + c`, commute those two terms, then put the parentheses back." },
  -- Multiplication
  { name := "mul_one", dir := "Multiplication",
    hint := "Rewrite `1` as `succ 0`; `mul_succ` exposes multiplication by zero and one final addition." },
  { name := "zero_mul", dir := "Multiplication",
    hint := "Induct on `m`. In the successor case, `mul_succ` exposes the smaller product from the induction hypothesis." },
  { name := "succ_mul", dir := "Multiplication",
    hint := "Induct on `b` so `mul_succ` applies on both sides. After using the induction hypothesis, rearrange the additions." },
  { name := "mul_comm", dir := "Multiplication",
    hint := "Induct on one factor. Pair `mul_zero` with `zero_mul` in the base case and `mul_succ` with `succ_mul` in the step." },
  { name := "one_mul", dir := "Multiplication",
    hint := "Commute the product to use the `mul_one` theorem you already proved." },
  { name := "two_mul", dir := "Multiplication",
    hint := "Write `2` as `succ 1`, then use `succ_mul` and the identity law for multiplication by 1." },
  { name := "mul_add", dir := "Multiplication",
    hint := "You can do induction on any of the three variables. Some choices\n  are harder to push through than others. Can you do the inductive step in\n  5 rewrites only?" },
  { name := "add_mul", dir := "Multiplication",
    hint := "Commute the outside product to expose `c * (a + b)`, use `mul_add`, then commute its two smaller products." },
  { name := "mul_assoc", dir := "Multiplication",
    hint := "Induct on `c`. The successor case uses `mul_succ` and `mul_add` to expose the smaller equality." },
  -- Power
  { name := "zero_pow_zero", dir := "Power",
    hint := "Apply the axiom `pow_zero` to 0. That axiom fixes the convention for every base, including 0." },
  { name := "zero_pow_succ", dir := "Power",
    hint := "The exponent is a successor, so use `pow_succ`. The resulting product has a zero factor." },
  { name := "pow_one", dir := "Power",
    hint := "Expose `1` as `succ 0`, then use `pow_succ`, `pow_zero`, and the multiplicative identity." },
  { name := "one_pow", dir := "Power",
    hint := "Induct on `m`; `pow_succ` exposes the induction hypothesis in the successor case." },
  { name := "pow_two", dir := "Power",
    hint := "Unfold the exponent with `two_eq_succ_one` and `pow_succ`, then use `pow_one`." },
  { name := "pow_add", dir := "Power",
    hint := "Induct on `n` so `add_succ` and `pow_succ` apply. The last step reassociates multiplication." },
  { name := "mul_pow", dir := "Power",
    hint := "Induct on `n`. After `pow_succ` and the induction hypothesis, rearrange the four factors with associativity and targeted commutativity." },
  { name := "pow_pow", dir := "Power",
    hint := "Induct on `n`. Use `mul_succ` in the exponent and your earlier `pow_add` theorem." },
  { name := "add_sq", dir := "Power",
    hint := "First replace each square with a product using `pow_two`. Distribute, then use `two_mul` to combine the two cross terms." },
  -- Implication
  { name := "exact", dir := "Implication",
    hint := "The goal in this level is one of our hypotheses. Solve the goal by executing `exact h1`." },
  { name := "exact2", dir := "Implication",
    hint := "You can use `rw [zero_add] at h` to rewrite at `h` instead\n  of at the goal." },
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
    hint := "Use `symm` on the goal, then apply the earlier theorem `zero_ne_one`." },
  { name := "two_add_two_ne_five", dir := "Implication",
    hint := "Introduce an equality assumption. Use the addition equations, then strip matching successors with `succ_inj` until zero would equal a successor." },
  -- AdvAddition
  { name := "add_right_cancel", dir := "AdvAddition",
    hint := "Start with induction on `n`." },
  { name := "add_left_cancel", dir := "AdvAddition",
    hint := "Introduce the equality, commute each sum, and apply `add_right_cancel`." },
  { name := "add_left_eq_self", dir := "AdvAddition",
    hint := "Rewrite the right side as `0 + y`, then use cancellation of the common right summand." },
  { name := "add_right_eq_self", dir := "AdvAddition",
    hint := "Rewrite with `add_comm` to turn `x + y` into `y + x`, then this is exactly\n  the `add_left_eq_self` you just proved." },
  { name := "add_right_eq_zero", dir := "AdvAddition",
    hint := "Here we want to deal with the cases `b = 0` and `b ≠ 0` separately,\n  so start with `cases b with d`." },
  { name := "add_left_eq_zero", dir := "AdvAddition",
    hint := "Commute the sum in the assumption, then reuse `add_right_eq_zero`." },
  -- LessOrEqual
  { name := "le_refl", dir := "LessOrEqual",
    hint := "The reason `x ≤ x` is because `x = x + 0`.\n  So you should start this proof with `use 0`." },
  { name := "zero_le", dir := "LessOrEqual",
    hint := "Choose `x` as the gap in the definition of `0 ≤ x`; the remaining equality uses `zero_add`." },
  { name := "le_succ_self", dir := "LessOrEqual",
    hint := "Choose 1 as the gap; `succ_eq_add_one` gives the required equality." },
  { name := "le_trans", dir := "LessOrEqual",
    hint := "Start with `cases hxy with a ha`." },
  { name := "le_zero", dir := "LessOrEqual",
    hint := "You want to use `add_right_eq_zero`, which you already\n  proved, but you'll have to start with `symm at` your hypothesis." },
  { name := "le_antisymm", dir := "LessOrEqual",
    hint := "Extract the two additive gaps from `hxy` and `hyx`. Substitution makes their sum zero; use the addition lemmas to show each gap is zero." },
  { name := "or_symm", dir := "LessOrEqual",
    hint := "We don't know whether to go left or right yet. So start with `cases h with hx hy`." },
  { name := "le_total", dir := "LessOrEqual",
    hint := "Start with `induction y with d hd`." },
  { name := "succ_le_succ", dir := "LessOrEqual",
    hint := "Extract the gap from `hx`. Rewrite with `succ_add` and remove matching successors using `succ_inj`; keep the same gap." },
  { name := "le_one", dir := "LessOrEqual",
    hint := "Split `x` into zero or a successor. In the successor case, `succ_le_succ` reduces the bound to a bound by zero." },
  { name := "le_two", dir := "LessOrEqual",
    hint := "Split `x` into zero or a successor. The successor case reduces to `le_one`; remember that the final disjunction groups to the right." },
  -- AdvMultiplication
  { name := "mul_le_mul_right", dir := "AdvMultiplication",
    hint := "Extract a gap `c` from `h`. Use `c * t` as the new gap and distribute the product." },
  { name := "mul_left_ne_zero", dir := "AdvMultiplication",
    hint := "We want to reduce this to a hypothesis `b = 0` and a goal `a * b = 0`,\n  which is logically equivalent but much easier to prove. Remember that `X ≠ 0`\n  is notation for `X = 0 → False`." },
  { name := "eq_succ_of_ne_zero", dir := "AdvMultiplication",
    hint := "Start with `cases a with d` to do a case split on `a = 0` and `a = succ d`." },
  { name := "one_le_of_ne_zero", dir := "AdvMultiplication",
    hint := "Use the previous lemma with `apply eq_succ_of_ne_zero at ha`." },
  { name := "le_mul_right", dir := "AdvMultiplication",
    hint := "Use `mul_left_ne_zero` to get `b ≠ 0`, then `one_le_of_ne_zero` to get `1 ≤ b`. Multiply that inequality by `a`." },
  { name := "mul_right_eq_one", dir := "AdvMultiplication",
    hint := "First establish `have h2 : x * y ≠ 0 := by rewrite [h]; exact one_ne_zero`. Then `le_mul_right x y h2` bounds `x` by the product; rewrite the product using `h`." },
  { name := "mul_ne_zero", dir := "AdvMultiplication",
    hint := "Start with `apply eq_succ_of_ne_zero at ha` and `... at hb`" },
  { name := "mul_eq_zero", dir := "AdvMultiplication",
    hint := "Start with `have h2 := mul_ne_zero a b`." },
  { name := "mul_left_cancel", dir := "AdvMultiplication",
    hint := "Generalize `c` and induct on `b`:\n  `induction b using MyNat.rec' generalizing c with`\n  `| zero => ...`\n  `| succ d hd => ...`" },
  { name := "mul_right_eq_self", dir := "AdvMultiplication",
    hint := "Reduce to the previous lemma with `nth_rewrite 2 [← mul_one a] at h`" },
  -- Algorithm
  { name := "add_left_comm", dir := "Algorithm",
    hint := "Reassociate to expose `a + b`, commute those two terms, then reassociate back." },
  { name := "add_algo1", dir := "Algorithm",
    hint := "Start with `repeat rw [add_assoc]` to push all the brackets to the right." },
  { name := "add_algo2", dir := "Algorithm",
    hint := "Solve this level in one line with `simp only [add_left_comm, add_comm]`" },
  { name := "add_algo3", dir := "Algorithm",
    hint := "Try the supplied `simp_add` tactic. Its definition packages the three addition rearrangement rules into a reusable tactic." },
  { name := "pred", dir := "Algorithm",
    hint := "Start with `rw [← pred_succ a]` and take it from there." },
  { name := "succ_ne_zero", dir := "Algorithm",
    hint := "Start with `intro h` (remembering that `X ≠ Y` is just notation\n  for `X = Y → False`)." },
  { name := "succ_ne_succ", dir := "Algorithm",
    hint := "`succ m ≠ succ n` unfolds to `succ m = succ n → False`, so `intro hs`.\n  Then `apply succ_inj at hs` gives `m = n`, which contradicts `h`." },
  { name := "decide", dir := "Algorithm",
    hint := "Use `simp only [ofNat_succ, add_succ, add_zero]` to turn the sum into successors. The simplifier can close this equality." },
  { name := "decide2", dir := "Algorithm",
    hint := "Normalize the sum with `simp only [ofNat_succ, add_succ, add_zero]`, then run `decide` on the remaining constructor inequality." },
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
    hint := "Associativity (`mul_assoc`) lets you shift the parentheses rightward; you may need it more than once." },
  { name := "reassoc_back", dir := "Semigroup",
    hint := "This is the previous goal reversed — `rw [← mul_assoc]` re-associates the other way." },
  { name := "reassoc_pair", dir := "Semigroup",
    hint := "Only the grouping differs; use `mul_assoc` (in which direction?)." },
  { name := "assoc_symm", dir := "Semigroup",
    hint := "A single use of `mul_assoc` relates the two sides." },
  { name := "reassoc5", dir := "Semigroup",
    hint := "Keep applying `mul_assoc` to peel the grouping off toward the right." },
  { name := "reassoc_mixed", dir := "Semigroup",
    hint := "Use `mul_assoc` to move the parentheses into place." },
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
  { name := "inv_mul_cancel_left", dir := "Group",
    hint := "Re-associate so `a⁻¹` and `a` sit together, then use that they cancel." },
  { name := "mul_inv_cancel_left", dir := "Group",
    hint := "Re-associate so `a` and `a⁻¹` sit together, then cancel." },
  { name := "inv_mul_cancel_right", dir := "Group",
    hint := "Re-associate so the `b⁻¹` and `b` are grouped, then cancel." },
  { name := "mul_inv_cancel_right", dir := "Group",
    hint := "Re-associate so the `b` and `b⁻¹` are grouped, then cancel." },
  { name := "inv_one", dir := "Group",
    hint := "Start from the inverse law applied to `1`, then simplify with `mul_one`." },
  { name := "mul_left_cancel", dir := "Group",
    hint := "Multiply both sides on the left by `a⁻¹`. A `calc` chain through `a⁻¹ * (a * b)` works." },
  { name := "mul_right_cancel", dir := "Group",
    hint := "Mirror of `mul_left_cancel`: multiply on the right by `c⁻¹`." },
  { name := "inv_inv", dir := "Group",
    hint := "`a⁻¹⁻¹` is the inverse of `a⁻¹`; show it equals `a` by inserting `a⁻¹ * a = 1`." },
  { name := "inv_inj", dir := "Group",
    hint := "Rewrite `a` as `a⁻¹⁻¹` (using `inv_inv`), apply `h`, then undo with `inv_inv`." },
  { name := "eq_inv_of_mul_eq_one", dir := "Group",
    hint := "Multiply `h` on the left by `a⁻¹`." },
  { name := "inv_eq_of_mul_eq_one", dir := "Group",
    hint := "You just proved the same fact the other way round — flip it." },
  { name := "mul_inv_rev", dir := "Group",
    hint := "If you can show `(a * b) * (b⁻¹ * a⁻¹) = 1`, uniqueness of inverses finishes it. (\"Socks and shoes\".)" },
  { name := "eq_of_mul_inv_eq_one", dir := "Group",
    hint := "Multiply by `b` on the right, using `h : a * b⁻¹ = 1`." },
  { name := "mul_eq_one_of_eq_inv", dir := "Group",
    hint := "Substitute for `a`, then an inverse law closes it." },
  { name := "mul_right_eq_self", dir := "Group",
    hint := "Write the right-hand `a` as `a * 1`, then cancel `a` (an earlier lemma)." },
  { name := "mul_left_eq_self", dir := "Group",
    hint := "Write the right-hand `b` as `1 * b`, then cancel `b`." },
  { name := "conj_cancel", dir := "Group",
    hint := "Group the trailing `g⁻¹ * g` and collapse it." },
  -- CommGroup
  { name := "mul_inv", dir := "CommGroup",
    hint := "Start from `mul_inv_rev`; commutativity does the rest." },
  { name := "mul_left_comm", dir := "CommGroup",
    hint := "Re-associate to expose `a * b`, swap it, then re-associate back." },
  { name := "mul_right_comm", dir := "CommGroup",
    hint := "Re-associate to expose `b * c`, swap it, then re-associate back." },
  { name := "inv_comm", dir := "CommGroup",
    hint := "Direct from commutativity." },
  { name := "mul_mul_mul_comm", dir := "CommGroup",
    hint := "The middle two factors need to swap; re-associate to bring `b` and `c` together first." },
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
    hint := "Use `f.map_mul` to split, then `map_inv` on the second factor." },
  { name := "map_div", dir := "Hom",
    hint := "Unfold both `/`s with `div_eq`, then `f.map_mul` and `map_inv`." },
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
  "*every* structure of that kind. Replace the `sorry` with a proof.\n\n" ++
  "Naming: the axioms are referred to by their full names, like\n" ++
  "`Group.inv_mul_cancel`, `CommGroup.mul_comm`, `Ring.add_assoc`. Only\n" ++
  "`mul_assoc`, `one_mul`, and `mul_one` are available unqualified. (Run\n" ++
  "`lake exe leanlings solution` if you get stuck on which lemma to use.)\n\n" ++
  "This course assumes the proof tactics from the `intro` course, especially\n" ++
  "`rw`, `calc`, `intro`, `exact`, and `cases`. If those are new to you, do the\n" ++
  "`intro` course first (`lake exe leanlings course intro`).\n"

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


private def analysisExercises : Array Exercise := #[
  -- Setoid
  { name := "r_refl", dir := "Setoid",
    hint := "`PreRat.r a a` unfolds to `a.num * a.den = a.num * a.den`. One tactic proves any `X = X`." },
  { name := "r_symm", dir := "Setoid",
    hint := "`unfold PreRat.r at *` gives integer equations; `omega` finishes." },
  { name := "r_trans", dir := "Setoid",
    hint := "After the given `apply`, prove `a.num*c.den*b.den = c.num*a.den*b.den` with a `calc` that uses `Int.mul_right_comm` and rewrites by `hab`/`hbc`." },
  -- WellDef
  { name := "add_resp", dir := "WellDef",
    hint := "`simp only [PreRat.r, PreRat.add] at *` then `grind`." },
  { name := "mul_resp", dir := "WellDef",
    hint := "Same as `add_resp` with `PreRat.mul`." },
  { name := "neg_resp", dir := "WellDef",
    hint := "Same pattern with `PreRat.neg`." },
  { name := "lt_imp", dir := "WellDef",
    hint := "Scale `h` by `Int.mul_pos c.den_pos d.den_pos`, rewrite with two `grind`-proved equalities, then cancel via `Int.mul_lt_mul_right`." },
  { name := "le_imp", dir := "WellDef",
    hint := "Mirror of `lt_imp` with `Int.mul_le_mul_of_nonneg_right` and `Int.mul_le_mul_right`." },
  -- Rat
  { name := "add_comm", dir := "Rat",
    hint := "`induction x using MyRat.ind`, `induction y`, `rw [add_mk, add_mk, mk_eq]`, `grind`." },
  { name := "add_assoc", dir := "Rat",
    hint := "Three inductions; `rw` `add_mk` four times, then `mk_eq`, `grind`." },
  { name := "zero_add", dir := "Rat",
    hint := "`rw [zero_def, add_mk, mk_eq]; grind`." },
  { name := "add_zero", dir := "Rat",
    hint := "Like `zero_add`." },
  { name := "neg_add_cancel", dir := "Rat",
    hint := "Expose `-x` with `neg_mk` and `0` with `zero_def`, then `mk_eq`, `grind`." },
  { name := "neg_neg", dir := "Rat",
    hint := "Two `neg_mk`s, then `mk_eq`, `grind`." },
  { name := "mul_comm", dir := "Rat",
    hint := "Like `add_comm` with `mul_mk`." },
  { name := "mul_assoc", dir := "Rat",
    hint := "Like `add_assoc` with `mul_mk`." },
  { name := "one_mul", dir := "Rat",
    hint := "`rw [one_def, mul_mk, mk_eq]; grind`." },
  { name := "mul_one", dir := "Rat",
    hint := "Like `one_mul`." },
  { name := "mul_zero", dir := "Rat",
    hint := "`rw [zero_def, mul_mk, mk_eq]; grind`." },
  { name := "left_distrib", dir := "Rat",
    hint := "Use both `add_mk` and `mul_mk`, then `mk_eq`, `grind`." },
  { name := "right_distrib", dir := "Rat",
    hint := "Like `left_distrib`." },
  { name := "mul_inv_cancel", dir := "Rat",
    hint := "After the given `ha`, `rw [inv_mk_of_ne hb ha, mul_mk, one_def, mk_eq]`, add `Int.sign_mul_natAbs a`, then `grind`." },
  -- RatOrder
  { name := "lt_irrefl", dir := "RatOrder",
    hint := "`induction`, `rw [lt_mk]`, `omega`." },
  { name := "lt_trans", dir := "RatOrder",
    hint := "Scale both hypotheses by positive denominators, chain with `Int.lt_trans`, cancel with `Int.mul_lt_mul_right`. `grind` proves the rearrangement equalities." },
  { name := "lt_trichotomy", dir := "RatOrder",
    hint := "`simp only [lt_mk, mk_eq]` then `omega`." },
  { name := "le_refl", dir := "RatOrder",
    hint := "`rw [le_mk]; omega`." },
  { name := "le_trans", dir := "RatOrder",
    hint := "Like `lt_trans` with the `≤` lemmas (`Int.mul_le_mul_of_nonneg_right`, `Int.le_trans`)." },
  { name := "add_lt_add_left", dir := "RatOrder",
    hint := "Reduce to integers, rewrite both sides as `P + Q` with `P` equal, and `omega` with `Q₁ < Q₂` from scaling `h` by `b*b`." },
  { name := "add_le_add_left", dir := "RatOrder",
    hint := "Like `add_lt_add_left` with `Int.mul_le_mul_of_nonneg_right`." },
  { name := "mul_pos", dir := "RatOrder",
    hint := "`0 < mk a b` is `0 < a`; use `Int.mul_pos` for `0 < a*c`." },
  { name := "abs_nonneg", dir := "RatOrder",
    hint := "`rw [abs_mk, zero_def, le_mk]; omega` (`natAbs` ≥ 0)." },
  { name := "abs_neg", dir := "RatOrder",
    hint := "Use `Int.natAbs_neg` in the `rw` chain after `mk_eq`." },
  { name := "abs_mul", dir := "RatOrder",
    hint := "Use `Int.natAbs_mul`, then `push_cast`, then `grind`." },
  { name := "abs_add_le", dir := "RatOrder",
    hint := "Prove the un-scaled `key` (via `Int.natAbs_add_le`, `Int.natAbs_mul`, and `den.natAbs = den`), then scale by `b*d ≥ 0`." },
  { name := "abs_lt", dir := "RatOrder",
    hint := "`simp only [abs_mk, neg_mk, lt_mk, Int.neg_mul]`, `by_cases 0 ≤ a`, rewrite `↑a.natAbs * d`, then `omega` with the sign of `a*d`." },
  { name := "archimedean", dir := "RatOrder",
    hint := "Witness `a.natAbs + 1`; after `ofInt_def, lt_mk, push_cast`, use `Int.mul_le_mul_of_nonneg_left` and `omega`." },
  { name := "exists_between", dir := "RatOrder",
    hint := "Midpoint `(a*d + c*b) / (2*b*d)`; each inequality follows from scaling `h` and `omega`." },
  -- Cauchy
  { name := "const_isCauchy", dir := "Cauchy",
    hint := "`intro ε hε; refine ⟨0, ...⟩; simp only [constSeq]; rw [MyRat.sub_self, MyRat.abs_zero]; exact hε`." },
  { name := "add_isCauchy", dir := "Cauchy",
    hint := "After the given setup, `calc` via `MyRat.add_sub_add`, `abs_add_le`, `MyRat.add_lt_add`, ending `= ε` by `hδδ`. Use the `Nat.le_max_*`/`Nat.le_trans` bounds." },
  { name := "neg_isCauchy", dir := "Cauchy",
    hint := "Same `N`; `rw [MyRat.neg_sub_neg, MyRat.abs_sub_comm]; exact hN ...`." },
  { name := "equiv_refl", dir := "Cauchy",
    hint := "Like `const_isCauchy`: `f n - f n = 0`." },
  { name := "equiv_symm", dir := "Cauchy",
    hint := "Reuse `N`; `rw [MyRat.abs_sub_comm]`." },
  { name := "equiv_trans", dir := "Cauchy",
    hint := "`exists_half`, `Nat.max`, then `calc` with `MyRat.abs_sub_le` and `MyRat.add_lt_add`." },
  -- Real
  { name := "add_comm", dir := "Real",
    hint := "`induction x using MyReal.ind`, `induction y`, `rw [add_mk, add_mk]`, then `exact eq_of_equiv (equiv_of_eq (fun n => MyRat.add_comm _ _))`." },
  { name := "add_assoc", dir := "Real",
    hint := "Three inductions, `add_mk` ×4, then `eq_of_equiv (equiv_of_eq (fun n => MyRat.add_assoc _ _ _))`." },
  { name := "zero_add", dir := "Real",
    hint := "`rw [zero_def, add_mk]`, then `MyRat.zero_add` pointwise." },
  { name := "add_zero", dir := "Real",
    hint := "Like `zero_add`." },
  { name := "neg_add_cancel", dir := "Real",
    hint := "`rw [neg_mk, add_mk, zero_def]`, then `MyRat.neg_add_cancel` pointwise." },
  { name := "mul_comm", dir := "Real",
    hint := "`rw [mul_mk, mul_mk]`, then `MyRat.mul_comm` pointwise." },
  { name := "mul_assoc", dir := "Real",
    hint := "`mul_mk` ×4, then `MyRat.mul_assoc` pointwise." },
  { name := "one_mul", dir := "Real",
    hint := "`rw [one_def, mul_mk]`, then `MyRat.one_mul` pointwise." },
  { name := "mul_one", dir := "Real",
    hint := "Like `one_mul`." },
  { name := "left_distrib", dir := "Real",
    hint := "`add_mk`, `mul_mk` ×3, `add_mk`, then `MyRat.left_distrib` pointwise." },
  { name := "ofRat_add", dir := "Real",
    hint := "`rw [ofRat_def ×3, add_mk]`, then `eq_of_equiv (equiv_of_eq (fun n => rfl))`." },
  { name := "ofRat_mul", dir := "Real",
    hint := "Like `ofRat_add` with `mul_mk`." },
  -- Capstone
  { name := "ofRat_pos", dir := "Capstone",
    hint := "`rw [lt_def, sub_zero, ofRat_def, isPos_mk]`; the eventual lower bound for `ofRat q` is `q` itself: `⟨q, hq, 0, fun n _ => by simp only [constSeq]; exact MyRat.le_refl q⟩`." },
  { name := "cauchy_seq_converges", dir := "Capstone",
    hint := "After the skeleton the goal is `δ ≤ ε - |f k - f n|`. Note `|f k - f n| ≤ δ` (`MyRat.le_of_lt (hN k n hk hn)`), then `rw [MyRat.le_sub_iff, ← hδδ]` and `exact MyRat.add_le_add_left δ _`." },
  -- Metric
  { name := "tendsto_const", dir := "Metric",
    hint := "`intro ε hε; refine ⟨0, fun n _ => ?_⟩; rw [dist_self]; exact MyReal.ofRat_pos hε`." },
  { name := "converges_isCauchySeq", dir := "Metric",
    hint := "Split `ε` with `MyRat.exists_half`. Then `calc dist (x m) (x n) ≤ dist (x m) L + dist L (x n) := dist_triangle _ _ _`, `_ < ofRat η + ofRat η := MyReal.add_lt_add (hN m hm) (by rw [dist_comm]; exact hN n hn)`, `_ = ofRat ε := by rw [← MyReal.ofRat_add, hηη]`." },
  -- Field
  { name := "mul_inv_cancel", dir := "RealField",
    hint := "`induction x using MyReal.ind`. Get `hnn : ¬ CauSeq.Null ⟨f, hf⟩` from `hx` via `mk_eq_zero_iff`, then `⟨q, hq, N, hN⟩ := CauSeq.apart hnn`. `rw [inv_mk_of_not_null hnn, mul_mk, one_def]`, `apply eq_of_equiv`; for `n ≥ N`, `f n ≠ 0` so `f n * (f n)⁻¹ = 1` (`MyRat.mul_inv_cancel`), giving difference `0`." },
  -- Complete
  { name := "approx", dir := "Complete",
    hint := "`induction x using MyReal.ind`. `cauchy_seq_converges f hf ε hε` gives `N`; use `q := f N`, then `rw [MyReal.abs_sub_comm]` and apply the bound at `N`." },
  { name := "approx_isCauchy", dir := "Complete",
    hint := "The path has three pieces: q m to x m, x m to x n, and x n to q n. Use `abs_sub_le` twice; reverse the first bound with `abs_sub_comm`. Combine hAm, hB, hAn with `MyReal.add_lt_add`, then use hμμ and hηη to add up the tolerances." },
  { name := "tendsto_of_approx", dir := "Complete",
    hint := "Use `abs_sub_le` with middle point `ofRat (q k)`. Bound the first distance using `hqspec k` and `hK0`, and the second using `hK1`. Both thresholds are below their maximum. Finish with `← ofRat_add` and hηη." },
  { name := "complete", dir := "Complete",
    hint := "Apply `approx_isCauchy` to hx and hqspec. For the final limit, `cauchy_seq_converges q hqcauchy` supplies the second hypothesis needed by `tendsto_of_approx`." }
]

private def analysisWelcome : String :=
  "Welcome to Real Analysis from Scratch!\n\n" ++
  "You will build the rational and real numbers from the ground up — no Mathlib —\n" ++
  "and develop their theory through Cauchy sequences toward the completeness of ℝ.\n\n" ++
  "The path: construct ℚ as a quotient of fractions (proving the equivalence\n" ++
  "relation and that the operations are well defined), develop its arithmetic\n" ++
  "and order theory (absolute value, the Archimedean property, density), build Cauchy\n" ++
  "sequences, and assemble ℝ as their quotient.\n\n" ++
  "Two ideas recur. (1) A statement about ℚ reduces, via `mk_eq` and the\n" ++
  "computation lemmas, to one about integers that `grind`/`omega` close. (2) A\n" ++
  "statement about ℝ reduces, via the quotient, to one about its Cauchy-sequence\n" ++
  "representatives — often pointwise to the ℚ fact you already proved.\n\n" ++
  "Each level opens with an explanation and names the lemmas you need. Replace the\n" ++
  "`sorry` with a proof, then run `lake exe leanlings run` (or use watch mode).\n" ++
  "This course assumes the tactics from the `intro` course (`rw`, `calc`,\n" ++
  "`induction`, `omega`); quotients are introduced as you go.\n"

private def analysisFinal : String :=
  "Congratulations! You built ℚ and ℝ from scratch.\n\n" ++
  "Along the way you proved:\n" ++
  "  - that cross-multiplication is an equivalence relation, and that +, ×, −, <,\n" ++
  "    ≤ respect it, so they descend to the quotient ℚ;\n" ++
  "  - the arithmetic and order theory of ℚ: algebraic laws (including inverse\n" ++
  "    cancellation), trichotomy, the triangle inequality, the Archimedean\n" ++
  "    property, and density;\n" ++
  "  - that constant, sum, negation sequences are Cauchy and that `CauchyEquiv` is\n" ++
  "    an equivalence relation;\n" ++
  "  - the ring theory of ℝ, built as the quotient of Cauchy sequences, with ℚ\n" ++
  "    embedded as the constant sequences;\n" ++
  "  - the capstone: ℝ is complete over ℚ — every Cauchy sequence of rationals\n" ++
  "    converges, in ℝ, to the real number it represents;\n" ++
  "  - the basics of abstract metric spaces (with ℝ as the example): that a\n" ++
  "    convergent sequence is Cauchy, proven from the axioms alone;\n" ++
  "  - that every nonzero real satisfies the inverse law `x * x⁻¹ = 1`;\n" ++
  "  - and the summit: ℝ is Cauchy-complete — every Cauchy sequence of reals\n" ++
  "    converges — proven by rational approximation.\n\n" ++
  "You have built the real numbers from nothing as a Cauchy-complete metric\n" ++
  "space with commutative-ring operations and inverses for nonzero elements.\n"

/-- Real analysis from scratch: construct ℚ and ℝ (via Cauchy sequences) in core
Lean, then develop their theory. -/
def analysis : Course :=
  mkCourse "analysis" "Real Analysis from Scratch"
    "Construct ℚ, then ℝ via Cauchy sequences — no Mathlib — and prove their theory."
    analysisExercises (welcome := analysisWelcome) (final := analysisFinal)

def courses : Array Course := #[intro, nng, algebra, analysis]

/-- Qualified exercise ids must be unique within each course; otherwise progress
tracking would be ambiguous again. -/
private def hasUniqueExerciseIds (course : Course) : Bool :=
  course.exercises.all fun exercise =>
    (course.exercises.filter (·.id == exercise.id)).size == 1

#guard courses.all hasUniqueExerciseIds

/-- The course used when none is selected or a stored selection is invalid. -/
def defaultCourse : Course := intro

/-- Find a course by its id. -/
def getCourse (id : String) : Option Course :=
  courses.find? (·.id == id)

end Leanlings.Config
