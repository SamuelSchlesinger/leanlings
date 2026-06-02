/- # Quiz 1: Library Catalog -/

inductive Genre where
  | science
  | history
  | fantasy
  deriving Repr

inductive Rating where
  | stars (n : Nat)
  | unrated
  deriving Repr

structure Book where
  title  : String
  author : String
  pages  : Nat
  genre  : Genre
  rating : Rating := .unrated
  deriving Repr

instance : BEq Genre where
  beq a b := match a, b with
    | .science, .science => true
    | .history, .history => true
    | .fantasy, .fantasy => true
    | _, _ => false

instance : ToString Rating where
  toString
    | .stars 1 => "1 star"
    | .stars n => s!"{n} stars"
    | .unrated => "unrated"

def Genre.name : Genre → String
  | .science => "science"
  | .history => "history"
  | .fantasy => "fantasy"

def Rating.toNat : Rating → Nat
  | .stars n => n
  | .unrated => 0

def Book.isLong (b : Book) : Bool := b.pages > 300

def Book.isWorthReading (b : Book) : Bool :=
  if b.rating.toNat > 3 then true
  else b.isLong && b.genre == .science

def Book.describe (b : Book) : String :=
  s!"{b.title} by {b.author} ({b.pages} pages, {b.genre.name})"

def Book.withRating (b : Book) (r : Rating) : Book :=
  { b with rating := r }

def findBook (title : String) : List Book → Option Book
  | [] => none
  | b :: bs => if b.title == title then some b else findBook title bs

def booksOfGenre (g : Genre) (books : List Book) : List Book :=
  books.filter (·.genre == g)

def titles (books : List Book) : List String :=
  books.map (·.title)

def totalPages (books : List Book) : Nat :=
  books.foldl (· + ·.pages) 0

def starBar : Rating → String
  | .stars 0 => ""
  | .stars (n + 1) => "*" ++ starBar (.stars n)
  | .unrated => ""

-- Proofs

theorem zero_not_long (b : Book) (h : b.pages = 0) :
    b.isLong = false := by
  simp [Book.isLong, h]

theorem withRating_rating (b : Book) (r : Rating) :
    (b.withRating r).rating = r := by
  rfl

theorem unrated_zero_stars (b : Book) (h : b.rating = .unrated) :
    b.rating.toNat = 0 := by
  simp [h, Rating.toNat]

theorem science_ne_history : Genre.science ≠ Genre.history := by
  intro h
  nomatch h

theorem genre_cases (g : Genre) :
    g = .science ∨ g = .history ∨ g = .fantasy :=
  match g with
  | .science => Or.inl rfl
  | .history => Or.inr (Or.inl rfl)
  | .fantasy => Or.inr (Or.inr rfl)

def pageCount : List Book → Nat
  | [] => 0
  | b :: bs => b.pages + pageCount bs

def bookTitles : List Book → List String
  | [] => []
  | b :: bs => b.title :: bookTitles bs

theorem pageCount_append (l1 l2 : List Book) :
    pageCount (l1 ++ l2) = pageCount l1 + pageCount l2 := by
  induction l1 with
  | nil => simp [pageCount]
  | cons b bs ih => simp [pageCount, ih, Nat.add_assoc]

theorem bookTitles_append (l1 l2 : List Book) :
    bookTitles (l1 ++ l2) = bookTitles l1 ++ bookTitles l2 := by
  induction l1 with
  | nil => simp [bookTitles]
  | cons b bs ih => simp [bookTitles, ih]
