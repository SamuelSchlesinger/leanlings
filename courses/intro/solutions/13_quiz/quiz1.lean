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
    g = .science ∨ g = .history ∨ g = .fantasy := by
  cases g with
  | science => exact Or.inl rfl
  | history => exact Or.inr (Or.inl rfl)
  | fantasy => exact Or.inr (Or.inr rfl)

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

-- Guards

def catalog : List Book := [
  ⟨"Dune", "Herbert", 412, .science, .stars 5⟩,
  ⟨"Sapiens", "Harari", 443, .history, .stars 4⟩,
  { title := "Cosmos", author := "Sagan", pages := 365, genre := .science },
  ⟨"The Hobbit", "Tolkien", 310, .fantasy, .stars 5⟩,
  ⟨"SPQR", "Beard", 606, .history, .stars 3⟩
]

#guard Genre.science == Genre.science
#guard Genre.history == Genre.history
#guard Genre.fantasy == Genre.fantasy
#guard Genre.science != Genre.history
#guard Genre.fantasy != Genre.science
#guard toString (Rating.stars 5) == "5 stars"
#guard toString (Rating.stars 2) == "2 stars"
#guard toString (Rating.stars 1) == "1 star"
#guard toString Rating.unrated == "unrated"
#guard Genre.name .science == "science"
#guard Genre.name .history == "history"
#guard Genre.name .fantasy == "fantasy"
#guard (Rating.stars 5).toNat == 5
#guard (Rating.stars 0).toNat == 0
#guard Rating.unrated.toNat == 0
#guard (⟨"Big", "A", 500, .fantasy, .unrated⟩ : Book).isLong == true
#guard (⟨"Small", "B", 100, .fantasy, .unrated⟩ : Book).isLong == false
#guard (⟨"Edge", "C", 300, .fantasy, .unrated⟩ : Book).isLong == false
#guard ({ title := "A", author := "B", pages := 500, genre := .science } : Book).isWorthReading == true
#guard (⟨"A", "B", 100, .fantasy, .stars 5⟩ : Book).isWorthReading == true
#guard ({ title := "A", author := "B", pages := 100, genre := .fantasy } : Book).isWorthReading == false
#guard (⟨"A", "B", 500, .fantasy, .stars 2⟩ : Book).isWorthReading == false
#guard Book.describe ⟨"Test", "Author", 100, .fantasy, .unrated⟩
    == "Test by Author (100 pages, fantasy)"
#guard ((⟨"X", "Y", 100, .fantasy, .unrated⟩ : Book).withRating (.stars 4)).rating.toNat == 4
#guard (findBook "Cosmos" catalog).isSome == true
#guard (findBook "Moby Dick" catalog).isSome == false
#guard (findBook "Dune" catalog).map (·.pages) == some 412
#guard (booksOfGenre .science catalog).length == 2
#guard (booksOfGenre .fantasy catalog).length == 1
#guard titles catalog == ["Dune", "Sapiens", "Cosmos", "The Hobbit", "SPQR"]
#guard totalPages [] == 0
#guard totalPages catalog == 2136
#guard starBar (.stars 3) == "***"
#guard starBar (.stars 1) == "*"
#guard starBar (.stars 0) == ""
#guard starBar .unrated == ""
