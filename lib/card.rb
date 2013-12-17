class Card
  attr_accessor :suit, :number, :display_value

  def initialize(number, suit)
    self.number = number
    self.suit = suit
    self.display_value = number + '-' + suit
  end

  def value
    case number
      when 'K', 'Q', 'J'
        10
      when 'A'
        1
      else
        number.to_i
    end
  end
end