import Leanlings.Exercise
import Leanlings.Course

namespace Leanlings

/-- Persistent state tracking progress across courses.

`completed` entries are namespaced as `"<courseId>/<exerciseName>"` so progress
in one course never collides with another. `currentExercise` is a bare name
within `currentCourse`. -/
structure AppState where
  currentCourse : String
  currentExercise : String
  completed : Array String
  deriving Repr

namespace AppState

def stateFile : System.FilePath := ".leanlings-state"

/-- The key under which an exercise's completion is recorded. -/
def key (courseId name : String) : String := s!"{courseId}/{name}"

def initial (course : Course) : AppState :=
  { currentCourse := course.id,
    currentExercise := (course.exercises.getD 0 default).name,
    completed := #[] }

/-- Load state from disk, or return initial state if no (valid) state file exists.

A stored course or exercise that no longer exists is repaired to a sensible
default rather than failing. -/
def load (courses : Array Course) (defaultCourse : Course) : IO AppState := do
  try
    let content ← IO.FS.readFile stateFile
    let lines := (content.splitOn "\n").filter (· != "")
    match lines with
    | course :: current :: rest =>
      let completed := (rest.filter (· != "---")).toArray
      let validCourse := if courses.any (·.id == course) then course else defaultCourse.id
      let activeCourse := (courses.find? (·.id == validCourse)).getD defaultCourse
      let validCurrent :=
        if activeCourse.exercises.any (·.name == current) then current
        else match activeCourse.exercises.findSome? (fun ex =>
               if !completed.contains (key validCourse ex.name) then some ex.name else none) with
             | some name => name
             | none => (activeCourse.exercises.getD 0 default).name
      pure { currentCourse := validCourse, currentExercise := validCurrent, completed }
    | _ => pure (initial defaultCourse)
  catch _ =>
    pure (initial defaultCourse)

/-- Save state to disk -/
def save (state : AppState) : IO Unit := do
  let completedStr := state.completed.foldl (fun acc s => acc ++ s ++ "\n") ""
  let content := s!"{state.currentCourse}\n{state.currentExercise}\n---\n{completedStr}"
  IO.FS.writeFile stateFile content

/-- Check if an exercise in the given course has been completed -/
def isCompleted (state : AppState) (courseId name : String) : Bool :=
  state.completed.contains (key courseId name)

/-- Mark an exercise in the given course as completed -/
def markCompleted (state : AppState) (courseId name : String) : AppState :=
  let k := key courseId name
  if state.completed.contains k then state
  else { state with completed := state.completed.push k }

/-- Switch the active course, moving to its first pending exercise. -/
def switchCourse (state : AppState) (course : Course) : AppState :=
  let current := match course.exercises.findSome? (fun ex =>
                   if !state.completed.contains (key course.id ex.name) then some ex.name else none) with
                 | some name => name
                 | none => (course.exercises.getD 0 default).name
  { state with currentCourse := course.id, currentExercise := current }

/-- Find the next pending exercise in the given course -/
def findNextPending (state : AppState) (course : Course) : Option String :=
  course.exercises.findSome? fun ex =>
    if !state.completed.contains (key course.id ex.name) then some ex.name else none

/-- Mark current exercise done and advance to next pending in the course -/
def advance (state : AppState) (course : Course) : AppState :=
  let state := state.markCompleted course.id state.currentExercise
  match state.findNextPending course with
  | some next => { state with currentExercise := next }
  | none => state

/-- Count completed exercises in the given course -/
def countDone (state : AppState) (course : Course) : Nat :=
  course.exercises.foldl (fun n ex =>
    if state.completed.contains (key course.id ex.name) then n + 1 else n) 0

/-- Check if all exercises in the given course are done -/
def allDone (state : AppState) (course : Course) : Bool :=
  course.exercises.all (fun ex => state.completed.contains (key course.id ex.name))

end AppState
end Leanlings
