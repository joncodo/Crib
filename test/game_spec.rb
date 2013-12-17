require 'game.rb'

describe Game do
  before(:each) do
    @game = Game.new
    @game.start_round
    @game.discard_to_crib
  end

  it 'have a crib with four cards' do
    player1_hand_size = @game.player1.hand.size
    player2_hand_size = @game.player2.hand.size
    deck_size = @game.deck.cards.size
    crib_size = @game.crib.size
    total_cards = player1_hand_size + player2_hand_size + deck_size + crib_size
    expect(total_cards).to eq 52
  end
end

describe Game, '#initialize' do
  before(:each) do
    @game = Game.new
  end

  it 'have two players and a deck' do
    expect(@game.player1.nil?).to eq false
    expect(@game.player2.nil?).to eq false
    expect(@game.deck.nil?).to eq false
  end
end

describe Game, '#start_round' do
  before(:each) do
    @game = Game.new
  end

  it 'deals out 6 cards to each player' do
    @game.start_round
    expect(@game.player1.hand.size).to eq 6
    expect(@game.player2.hand.size).to eq 6
  end
end

describe Game, '#discard_to_crib' do
  before(:each) do
    @game = Game.new
    @game.start_round
    @game.discard_to_crib
  end

  it 'have a crib with four cards' do
    expect(@game.crib.size).to eq 4
  end
end

describe Game, '#flip_top_deck_card' do
  before(:each) do
    @game = Game.new
    @game.start_round
    @game.discard_to_crib
    @game.flip_top_deck_card
  end

  it 'have a crib with four cards' do
    expect(@game.top_card.nil?).to eq false
  end
end

#
#context 'when a game is in progress' do
#  context 'each round' do
#    should 'every odd round crib goes to player 1' do
#
#    end
#
#    should 'every even round crib should go to player 2' do
#
#    end
#
#    should 'start with the hands being delt randomly' do
#
#    end
#  end
#end
#
#context 'when keeping score for the whole game' do
#  should 'end the game at 121 points' do
#
#  end
#
#  should 'keep each players score separate' do
#
#  end
#
#  should 'add each round score to the total score for the player' do
#
#  end
#
#  should 'total the scores after each round' do
#
#  end
#end
