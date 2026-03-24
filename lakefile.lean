import Lake
open Lake DSL

package «leanlings» where
  version := v!"0.1.0"

lean_lib «Leanlings»

@[default_target]
lean_exe «leanlings» where
  root := `Main
