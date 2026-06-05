import Lake
open Lake DSL

package «leanlings» where
  version := v!"0.1.0"

lean_lib «Leanlings»

@[default_target]
lean_exe «leanlings» where
  root := `Main

-- The `nng` course (Natural Number Game port) is a self-contained Lean library:
-- its solution files form one growing import-chain, so building it verifies every
-- solution. Exercises live outside the library and are checked on demand via
-- `lake env lean`. See courses/nng/.
@[default_target]
lean_lib «NNG» where
  srcDir := "courses/nng/solutions"
  -- Modules live under flat namespaces (`MyNatLib.*`, and one per world), so we
  -- enumerate them explicitly rather than rely on a single root prefix.
  globs := #[
    Glob.one `NNG,
    Glob.submodules `MyNatLib,
    Glob.submodules `Tutorial,
    Glob.submodules `Addition,
    Glob.submodules `Multiplication,
    Glob.submodules `Power,
    Glob.submodules `Implication,
    Glob.submodules `AdvAddition,
    Glob.submodules `LessOrEqual,
    Glob.submodules `AdvMultiplication,
    Glob.submodules `Algorithm
  ]

-- The `algebra` course (a from-scratch Bourbaki-style algebraic hierarchy) is
-- likewise a self-contained Lean library: its solutions form one import-chain
-- proving theorems generically over the typeclasses in `AlgebraLib`. See
-- courses/algebra/.
@[default_target]
lean_lib «Algebra» where
  srcDir := "courses/algebra/solutions"
  globs := #[
    Glob.one `AlgebraCourse,
    Glob.submodules `AlgebraLib,
    Glob.submodules `Magma,
    Glob.submodules `Semigroup,
    Glob.submodules `Monoid,
    Glob.submodules `Group,
    Glob.submodules `CommGroup,
    Glob.submodules `Division,
    Glob.submodules `Hom,
    Glob.submodules `Ring,
    Glob.submodules `CommRing,
    Glob.submodules `Field
  ]

-- The `analysis` course (a from-scratch construction of ℚ, then ℝ via Cauchy
-- sequences, then metric spaces and real analysis) is likewise a self-contained
-- Lean library: `AnalysisLib` holds the ℚ construction, and the solution chain
-- builds the theory up to the completeness of ℝ. See courses/analysis/.
@[default_target]
lean_lib «Analysis» where
  srcDir := "courses/analysis/solutions"
  globs := #[
    Glob.one `AnalysisCourse,
    Glob.submodules `AnalysisLib,
    Glob.submodules `Setoid,
    Glob.submodules `WellDef,
    Glob.submodules `Rat,
    Glob.submodules `RatOrder,
    Glob.submodules `Cauchy,
    Glob.submodules `Real,
    Glob.submodules `Metric,
    Glob.submodules `Capstone,
    Glob.submodules `RealField,
    Glob.submodules `Complete
  ]
