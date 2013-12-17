class Player
  attr_accessor :hand, :score

  def initialize
    self.hand = []
    self.score = 0
  end

  def add_card(card)
    self.hand << card
  end

  def choose_discard
    #to be filled in by the teams
    card1 = discard(hand.first)
    card2 = discard(hand.last)
    [card1, card2]
  end

  private

  def discard(card)
    self.hand = hand - [card]
    card
  end
end