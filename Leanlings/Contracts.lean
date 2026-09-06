import Lean

/-! Build-time helper for reference-derived theorem contracts. The generated
checks use only ordinary Lean terms; this metaprogram is not a course import. -/

open Lean Elab Command Meta in
elab "#emit_leanlings_contracts" : command => do
  let env ← getEnv
  let mut contracts : Array Json := #[]
  for (name, info) in env.constants.toList do
    if (env.getModuleIdxFor? name).isSome || name.isInternal || isPrivateName name then
      continue
    -- Equation lemmas and recursor theorems describe the compiler's chosen
    -- implementation. Only declarations with their own source location are
    -- tasks: a different valid implementation must remain acceptable.
    if (← findDeclarationRangesCore? name).isNone then
      continue
    match info with
    | .thmInfo val =>
      let type ← liftTermElabM do
        withOptions (fun opts => opts
          |>.setBool `pp.universes true
          |>.setBool `pp.fullNames true
          |>.setBool `pp.explicit true
          |>.setBool `pp.notation false) do
            return (← ppExpr val.type).pretty
      contracts := contracts.push <| Json.mkObj [
        ("name", toJson name.toString),
        ("check", toJson s!"section\nset_option autoImplicit true in\nexample : {type} := @{name}\n#print axioms {name}\nend\n")]
    | _ => pure ()
  IO.println ("LEANLINGS_CONTRACTS " ++ (toJson contracts).compress)
