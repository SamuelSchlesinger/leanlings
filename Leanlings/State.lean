import Leanlings.Exercise
import Leanlings.Course

namespace Leanlings

/-- Persistent state tracking progress across courses.

`completed` entries are namespaced as `"<courseId>/<exerciseId>"`, where an
exercise id is `"<dir>/<name>"`, so neither duplicate names within a course nor
names shared by different courses collide. `currentExercise` is a qualified id
within `currentCourse`. -/
structure AppState where
  currentCourse : String
  currentExercise : String
  completed : Array String
  deriving Repr

namespace AppState

def stateFile : System.FilePath := ".leanlings-state"

/-- The key under which an exercise's completion is recorded. -/
def key (courseId exerciseId : String) : String := s!"{courseId}/{exerciseId}"

def initial (course : Course) : AppState :=
  { currentCourse := course.id,
    currentExercise := (course.exercises.getD 0 default).id,
    completed := #[] }

/-- Upgrade one completion key from the old `course/name` format to
`course/dir/name`. For an old ambiguous name, selecting the first matching
exercise is conservative: that is the only exercise the old runner could
resolve and check. Unknown keys are retained unchanged. -/
def migrateCompletedKey (courses : Array Course) (stored : String) : String :=
  match courses.findSome? fun course =>
    let coursePrefix := s!"{course.id}/"
    if stored.startsWith coursePrefix then
      let target := stored.drop coursePrefix.length
      match course.exercises.find? (·.id == target) with
      | some exercise => some (key course.id exercise.id)
      | none =>
        match course.exercises.find? (·.name == target) with
        | some exercise => some (key course.id exercise.id)
        | none => none
    else
      none
  with
  | some migrated => migrated
  | none => stored

/-- Migrate and deduplicate all stored completion keys. -/
def normalizeCompleted (courses : Array Course) (stored : Array String) : Array String :=
  stored.foldl (fun completed oldKey =>
    let newKey := migrateCompletedKey courses oldKey
    if completed.contains newKey then completed else completed.push newKey) #[]

/-- Resolve either a current qualified id or a current name from an older state
file. Legacy ambiguous names select the first exercise for the same reason as
`migrateCompletedKey`. -/
private def resolveStoredExercise (course : Course) (stored : String) : Option Exercise :=
  match course.exercises.find? (·.id == stored) with
  | some exercise => some exercise
  | none => course.exercises.find? (·.name == stored)

/-- Load state from disk, or return initial state if no (valid) state file exists.

A stored course or exercise that no longer exists is repaired to a sensible
default rather than failing. -/
def load (courses : Array Course) (defaultCourse : Course) : IO AppState := do
  try
    let content ← IO.FS.readFile stateFile
    let lines := (content.splitOn "\n").filter (· != "")
    match lines with
    | course :: current :: rest =>
      let completed := normalizeCompleted courses (rest.filter (· != "---")).toArray
      let validCourse := if courses.any (·.id == course) then course else defaultCourse.id
      let activeCourse := (courses.find? (·.id == validCourse)).getD defaultCourse
      let validCurrent :=
        match resolveStoredExercise activeCourse current with
        | some exercise => exercise.id
        | none =>
          match activeCourse.exercises.findSome? (fun ex =>
            if !completed.contains (key validCourse ex.id) then some ex.id else none) with
          | some exerciseId => exerciseId
          | none => (activeCourse.exercises.getD 0 default).id
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
def isCompleted (state : AppState) (courseId exerciseId : String) : Bool :=
  state.completed.contains (key courseId exerciseId)

/-- Mark an exercise in the given course as completed -/
def markCompleted (state : AppState) (courseId exerciseId : String) : AppState :=
  let k := key courseId exerciseId
  if state.completed.contains k then state
  else { state with completed := state.completed.push k }

/-- Mark an exercise as not completed (used by `reset`). -/
def markIncomplete (state : AppState) (courseId exerciseId : String) : AppState :=
  { state with completed := state.completed.filter (· != key courseId exerciseId) }

/-- Switch the active course, moving to its first pending exercise. -/
def switchCourse (state : AppState) (course : Course) : AppState :=
  let current := match course.exercises.findSome? (fun ex =>
                   if !state.completed.contains (key course.id ex.id) then some ex.id else none) with
                 | some exerciseId => exerciseId
                 | none => (course.exercises.getD 0 default).id
  { state with currentCourse := course.id, currentExercise := current }

/-- Find the next pending exercise in the given course -/
def findNextPending (state : AppState) (course : Course) : Option String :=
  course.exercises.findSome? fun ex =>
    if !state.completed.contains (key course.id ex.id) then some ex.id else none

/-- Mark current exercise done and advance to next pending in the course -/
def advance (state : AppState) (course : Course) : AppState :=
  let state := state.markCompleted course.id state.currentExercise
  match state.findNextPending course with
  | some next => { state with currentExercise := next }
  | none => state

/-- Count completed exercises in the given course -/
def countDone (state : AppState) (course : Course) : Nat :=
  course.exercises.foldl (fun n ex =>
    if state.completed.contains (key course.id ex.id) then n + 1 else n) 0

/-- Check if all exercises in the given course are done -/
def allDone (state : AppState) (course : Course) : Bool :=
  course.exercises.all (fun ex => state.completed.contains (key course.id ex.id))

end AppState
end Leanlings
