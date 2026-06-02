def myFst {α β : Type} (p : α × β) : α := p.1

def mySwap {α β : Type} (p : α × β) : β × α := (p.2, p.1)

def mapPair {α β γ : Type} (f : α → γ) (g : β → γ) (p : α × β) : γ × γ := (f p.1, g p.2)
