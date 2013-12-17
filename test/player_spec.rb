require 'player.rb'

describe Player, '#initialize' do
  before(:each) do
    @player = Player.new
  end

  it 'has 0 cards when new' do
    @player.hand.size.should eq(0)
  end

  it 'has a card after you deal a card to it' do
    @player.add_card('4-C')
    expect(@player.hand.size).to eq(1)
  end

  it 'should have a score of 0 when game starts' do
    expect(@player.score).to eq(0)
  end

  it 'should have a score of 15 if 5 was scored previously and 10 scored now' do
    @player.score = 5
    @player.score += 10
    expect(@player.score).to eq(15)
  end
end

describe Player, '#choose_discard' do
  before(:each) do
    @player = Player.new
    @player.hand = ['A-S', 'K-C', '10-H', '4-D', '3-C', '2-H']
  end

  it 'has 4 cards after discard' do
    @player.choose_discard
    expect(@player.hand.size).to eq 4
  end
end


#
#context 'having a player' do
#  should 'the cards in all players plus the cards in the crib plus the cards in the deck should be a full deck' do
#
#  end
#
#  should 'newly delt players shoudl have 6 cards' do
#
#  end
#
#  should 'after you discard each player should have 4 cards' do
#
#  end
#end


