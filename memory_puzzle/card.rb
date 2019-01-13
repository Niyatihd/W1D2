class Card
  attr_reader :symbol, :hidden

  CARDS = ["A", "B", "C", "D", "E", "F", "G", "H"]
  
  def initialize(symbol = CARDS.sample)
      @symbol = symbol
      @hidden = true
  end

  def self.generate_cards
    CARDS
  end

  def hide
    if @hidden == false
      @hidden = true
    end
  end

  def reveal
    if @hidden == true
      @hidden = false
    end 
  end

  def ==(other_card)
    self.symbol == other_card.symbol
  end

end

# new_card = Card.new("A")
# other_card = Card.new("A")
# p new_card == other_card