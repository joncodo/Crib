load 'lib/game.rb'

def show_cards(hand)
  return_string = ''
  hand.each do |card|
    return_string += (card.display_value + "\n")
  end
  puts return_string
end

game = Game.new
game.start_round
game.discard_to_crib
game.flip_top_deck_card

puts '...Crib Hand...'

show_cards(game.crib)
puts ''

puts '...Player 1 Hand...'

show_cards(game.player1.hand)
puts ''

puts '...Player 2 Hand...'

show_cards(game.player2.hand)
puts ''

puts '...Top Card...'

puts game.top_card.display_value
puts ''
