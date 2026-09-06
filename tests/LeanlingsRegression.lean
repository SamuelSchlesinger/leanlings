import Leanlings

open Leanlings

/-! Regression checks for course identity, state migration, and runner output. -/

#guard Config.analysis.exercises.size == 64
#guard (Config.analysis.getExercise "add_comm").isNone
#guard (Config.analysis.getExercise "mul_inv_cancel").isNone
#guard (Config.analysis.getExercise "Rat/add_comm").map (·.dir) == some "Rat"
#guard (Config.analysis.getExercise "Real/add_comm").map (·.dir) == some "Real"
#guard (Config.analysis.getExercise "RealField/mul_inv_cancel").map (·.dir) ==
  some "RealField"
#guard (Config.analysis.getExercise "ofRat_add").map (·.id) == some "Real/ofRat_add"
#guard (Config.algebra.getExercise "mul_inv_cancel").map (·.id) == some "Field/mul_inv_cancel"

def migratedLegacy : Array String :=
  AppState.normalizeCompleted Config.courses
    #["analysis/add_comm", "analysis/add_comm", "intro/intro1", "unknown/key"]

#guard migratedLegacy ==
  #["analysis/Rat/add_comm", "intro/00_intro/intro1", "unknown/key"]

def oneDuplicateCompletion : AppState :=
  { currentCourse := "analysis"
    currentExercise := "Rat/add_comm"
    completed := #["analysis/Rat/add_comm"] }

#guard oneDuplicateCompletion.countDone Config.analysis == 1

def stateAfterCauchy : AppState :=
  { currentCourse := "analysis"
    currentExercise := "Cauchy/equiv_trans"
    completed := Config.analysis.exercises
      |>.filter (fun exercise =>
        #["Setoid", "WellDef", "Rat", "RatOrder", "Cauchy"].contains exercise.dir)
      |>.map (fun exercise => AppState.key Config.analysis.id exercise.id) }

#guard stateAfterCauchy.findNextPending Config.analysis == some "Real/add_comm"

def stateAfterMetric : AppState :=
  { currentCourse := "analysis"
    currentExercise := "Metric/converges_isCauchySeq"
    completed := Config.analysis.exercises
      |>.filter (fun exercise => exercise.dir != "RealField" && exercise.dir != "Complete")
      |>.map (fun exercise => AppState.key Config.analysis.id exercise.id) }

#guard stateAfterMetric.findNextPending Config.analysis ==
  some "RealField/mul_inv_cancel"

private def outputFixture (name expected : String) : Exercise :=
  { name
    dir := "Runner"
    course := "../tests/fixtures"
    expectedOutput := some expected }

def main : IO UInt32 := do
  let fixture := fun name => { name, dir := "Runner", course := "../tests/fixtures" : Exercise }
  match ← Runner.checkExercise (fixture "changed_statement") with
  | .compileError _ => pure ()
  | other => throw <| IO.userError s!"Changed theorem statement accepted: {repr other}"
  match ← Runner.checkExercise (fixture "quiet_sorry") with
  | .hasSorry => pure ()
  | other => throw <| IO.userError s!"Suppressed sorry warning bypassed the contract: {repr other}"
  match ← Runner.checkExercise (fixture "mixed_errors") with
  | .compileError message =>
    unless message.toLower.contains "type mismatch" do
      throw <| IO.userError s!"Missing type error: {message}"
  | other => throw <| IO.userError s!"Type error hidden behind sorry: {repr other}"
  let goodStatus ← Runner.checkExercise (outputFixture "good" "expected\n")
  let silentStatus ← Runner.checkExercise (outputFixture "silent" "expected\n")
  match goodStatus, silentStatus with
  | .success, .compileError message =>
    if message.contains "prints the wrong output" then
      return 0
    IO.eprintln s!"Unexpected output mismatch diagnostic: {message}"
    return 1
  | _, _ =>
    IO.eprintln s!"Unexpected runner statuses: {repr goodStatus}, {repr silentStatus}"
    return 1
