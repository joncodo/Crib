require 'card.rb'

describe Card do
  before(:each) do
    @king = Card.new('K', 'Hearts')
    @queen = Card.new('Q', 'Hearts')
    @jack = Card.new('J', 'Hearts')
    @ace = Card.new('A', 'Hearts')
    @five = Card.new('5', 'Hearts')
    @ten = Card.new('10', 'Hearts')
    @three = Card.new('3', 'Hearts')

  end

  describe Card, '#value' do
    it 'is 10 for face cards' do
      expect(@king.value).to eq 10
      expect(@queen.value).to eq 10
      expect(@jack.value).to eq 10
    end

    it 'is 1 for an ace' do
      expect(@ace.value).to eq 1
    end

    it 'is has the number value for all other cards' do
      expect(@five.value).to eq 5
      expect(@ten.value).to eq 10
      expect(@three.value).to eq 3
    end
  end
end
