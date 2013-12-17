load 'lib/player.rb'
load 'lib/deck.rb'

class Game
  attr_accessor :player1, :player2, :deck, :crib, :top_card

  def initialize
    self.deck = Deck.new
    self.player1 = Player.new
    self.player2 = Player.new
    self.crib = []
  end

  def start_round
    6.times do
      card = deck.deal_one
      player1.add_card(card)
      card = deck.deal_one
      player2.add_card(card)
    end
  end

  def discard_to_crib
    card1, card2 = player1.choose_discard
    card3, card4 = player2.choose_discard
    self.crib = [card1, card2, card3, card4]
  end

  def flip_top_deck_card
    self.top_card = deck.deal_one
  end

  def score
    puts 'Player1 Score: ' + player1.score.to_s
    puts 'Player2 Score: ' + player2.score.to_s
  end
end