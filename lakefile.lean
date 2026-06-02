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
