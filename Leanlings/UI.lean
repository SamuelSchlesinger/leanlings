namespace Leanlings.UI

def green (s : String) : String := s!"\x1b[32m{s}\x1b[0m"
def red (s : String) : String := s!"\x1b[31m{s}\x1b[0m"
def yellow (s : String) : String := s!"\x1b[33m{s}\x1b[0m"
def cyan (s : String) : String := s!"\x1b[36m{s}\x1b[0m"
def bold (s : String) : String := s!"\x1b[1m{s}\x1b[0m"
def dim (s : String) : String := s!"\x1b[2m{s}\x1b[0m"

def clearScreen : String := "\x1b[2J\x1b[H"

def progressBar (done total : Nat) : String :=
  let width := 30
  let filled := if total > 0 then done * width / total else 0
  let empty := width - filled
  let bar := String.ofList (List.replicate filled '█') ++
             String.ofList (List.replicate empty '░')
  s!"Progress: [{bar}] {done}/{total}"

end Leanlings.UI
