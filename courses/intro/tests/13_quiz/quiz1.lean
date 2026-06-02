-- Hidden correctness checks for this exercise (not shown to the learner).
-- =============================================

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

