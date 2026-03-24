import Leanlings.Exercise

namespace Leanlings

/-- Persistent state tracking exercise progress -/
structure AppState where
  currentExercise : String
  completed : Array String
  deriving Repr

namespace AppState

def stateFile : System.FilePath := ".leanlings-state"

def initial (exercises : Array Exercise) : AppState :=
  { currentExercise := (exercises.getD 0 default).name, completed := #[] }

/-- Load state from disk, or return initial state if no state file exists -/
def load (exercises : Array Exercise) : IO AppState := do
  try
    let content ← IO.FS.readFile stateFile
    let lines := (content.splitOn "\n").filter (· != "")
    match lines with
    | current :: rest =>
      let completed := (rest.filter (· != "---")).toArray
      let validCompleted := completed.filter (fun name => exercises.any (·.name == name))
      let validCurrent := if exercises.any (·.name == current) then current
                          else match exercises.findSome? (fun ex => if !validCompleted.contains ex.name then some ex.name else none) with
                               | some name => name
                               | none => (exercises.getD 0 default).name
      pure { currentExercise := validCurrent, completed := validCompleted }
    | [] => pure (initial exercises)
  catch _ =>
    pure (initial exercises)

/-- Save state to disk -/
def save (state : AppState) : IO Unit := do
  let completedStr := state.completed.foldl (fun acc s => acc ++ s ++ "\n") ""
  let content := s!"{state.currentExercise}\n---\n{completedStr}"
  IO.FS.writeFile stateFile content

/-- Check if an exercise has been completed -/
def isCompleted (state : AppState) (name : String) : Bool :=
  state.completed.contains name

/-- Mark an exercise as completed -/
def markCompleted (state : AppState) (name : String) : AppState :=
  if state.completed.contains name then state
  else { state with completed := state.completed.push name }

/-- Find the next pending exercise -/
def findNextPending (state : AppState) (exercises : Array Exercise) : Option String :=
  exercises.findSome? fun ex =>
    if !state.completed.contains ex.name then some ex.name else none

/-- Mark current exercise done and advance to next pending -/
def advance (state : AppState) (exercises : Array Exercise) : AppState :=
  let state := state.markCompleted state.currentExercise
  match state.findNextPending exercises with
  | some next => { state with currentExercise := next }
  | none => state

/-- Count completed exercises -/
def countDone (state : AppState) : Nat :=
  state.completed.size

/-- Check if all exercises are done -/
def allDone (state : AppState) (exercises : Array Exercise) : Bool :=
  exercises.all (fun ex => state.completed.contains ex.name)

end AppState
end Leanlings
