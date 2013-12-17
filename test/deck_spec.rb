require 'deck.rb'

describe Deck, '#initialize' do
  before(:each) do
    @deck = Deck.new
  end

  it 'has 52 cards when new' do
    @deck.cards.size.should eq(52)
  end

  it 'has no duplicate cards' do
    @deck.cards.uniq.size.should eq(52)
  end
end

describe Deck, '#deal' do
  before(:each) do
    @deck = Deck.new
  end

  it 'should deal a card' do
    expect(@deck.deal_one.nil?).to eq(false)
  end

  it 'should have one less card once one is dealt' do
    card = @deck.deal_one
    @deck.cards.size.should eq(51)
    expect(@deck.cards.include?(card)).to eq(false)
  end

  it 'should have no cards when all cards are delt' do
    52.times do
      @deck.deal_one
    end
    @deck.cards.size.should eq(0)
  end
end



#  should 'deal cards one a time until a maximum of 6 cards' do
#
#  end
#
#  should 'deal one to itself after crib is present' do
#
#  end
#end