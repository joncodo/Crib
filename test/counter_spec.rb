require 'counter.rb'
require 'card.rb'

describe Counter do
  before(:each) do
    @counter = Counter.new([Card.new('J', 'Hearts'),
                            Card.new('2', 'Hearts'),
                            Card.new('3', 'Hearts'),
                            Card.new('4', 'Hearts')],
                           Card.new('5', 'Hearts'))
    @bad_counter = Counter.new([Card.new('J', 'Clubs'),
                                Card.new('2', 'Hearts'),
                                Card.new('3', 'Hearts'),
                                Card.new('4', 'Hearts')],
                               Card.new('5', 'Hearts'))

    @pair_counter = Counter.new([Card.new('J', 'Clubs'),
                                Card.new('2', 'Hearts'),
                                Card.new('3', 'Hearts'),
                                Card.new('4', 'Hearts')],
                               Card.new('3', 'Diamonds'))

    @tri_counter = Counter.new([Card.new('J', 'Clubs'),
                                 Card.new('3', 'Hearts'),
                                 Card.new('3', 'Clubs'),
                                 Card.new('4', 'Hearts')],
                                Card.new('3', 'Diamonds'))

    @quad_counter = Counter.new([Card.new('J', 'Clubs'),
                                   Card.new('3', 'Spaids'),
                                   Card.new('3', 'Hearts'),
                                   Card.new('3', 'Clubs')],
                                  Card.new('3', 'Diamonds'))

    @double_pair_counter = Counter.new([Card.new('J', 'Clubs'),
                                 Card.new('3', 'Spaids'),
                                 Card.new('3', 'Hearts'),
                                 Card.new('Q', 'Clubs')],
                                Card.new('Q', 'Diamonds'))
  end

  describe Counter, '#right_jack_score' do
    it 'has a score of one with right jack' do
      expect(@counter.right_jack_score).to eq 1
    end

    it 'has a score of zero with wrong jack' do
      expect(@bad_counter.right_jack_score).to eq 0
    end
  end

  describe Counter, '#pairs_score' do
    it 'has a score of two with one pair' do
      expect(@pair_counter.pairs_score).to eq 2
    end

    it 'has a score of 6 with a triplet' do
      expect(@tri_counter.pairs_score).to eq 6
    end

    it 'has a score of 12 with quadruplets' do
      expect(@quad_counter.pairs_score).to eq 12
    end

    it 'has a score of 4 with two set of different pairs' do
      expect(@double_pair_counter.pairs_score).to eq 4
    end

    it 'has a score of 0 with no pairs' do
      expect(@counter.pairs_score).to eq 0
    end
  end

  describe Counter, '#flush_score' do
    before(:each) do
      @flush_4 = Counter.new([Card.new('J', 'Hearts'),
                                Card.new('2', 'Hearts'),
                                Card.new('3', 'Hearts'),
                                Card.new('4', 'Hearts')],
                               Card.new('5', 'Clubs'))

      @flush_4_bad = Counter.new([Card.new('J', 'Hearts'),
                              Card.new('2', 'Hearts'),
                              Card.new('3', 'Hearts'),
                              Card.new('4', 'Clubs')],
                             Card.new('5', 'Hearts'))

      @flush_5 = Counter.new([Card.new('J', 'Spaids'),
                              Card.new('2', 'Spaids'),
                              Card.new('3', 'Spaids'),
                              Card.new('4', 'Spaids')],
                             Card.new('5', 'Spaids'))

      @flush_4_crib = Counter.new([Card.new('J', 'Hearts'),
                              Card.new('2', 'Hearts'),
                              Card.new('3', 'Hearts'),
                              Card.new('4', 'Hearts')],
                             Card.new('5', 'Clubs'), 'crib')

      @flush_5_crib = Counter.new([Card.new('J', 'Spaids'),
                              Card.new('2', 'Spaids'),
                              Card.new('3', 'Spaids'),
                              Card.new('4', 'Spaids')],
                             Card.new('5', 'Spaids'), 'crib')
    end

    it 'has four points when you have a 4 card flush in your hand' do
      expect(@flush_4.flush_score).to eq 4
    end

    it ' has 0 points if the four cards are not in your hand' do
      expect(@flush_4.flush_score).to eq 0
    end

    it 'has five points if you have a 5 card flush' do
      expect(@flush_5.flush_score).to eq 5
    end

    it 'has 0 points if you have three of the same suit' do
      expect(@flush_4_crib.flush_score).to eq 0
    end

    it 'has 0 points if you have a 4 card flush in the crib' do
      expect(@flush_5_crib.flush_score).to eq 5
    end

    it 'has 5 points if the crib has a 5 card flush' do

    end
  end

  describe Counter, '#fifteen_score' do
    before(:each) do
      @fifteen = Counter.new([Card.new('J', 'Hearts'),
                              Card.new('9', 'Hearts'),
                              Card.new('5', 'Hearts'),
                              Card.new('4', 'Hearts')],
                             Card.new('7', 'Clubs'))

      @fifteen_2 = Counter.new([Card.new('J', 'Hearts'),
                              Card.new('2', 'Hearts'),
                              Card.new('3', 'Hearts'),
                              Card.new('4', 'Hearts')],
                             Card.new('Q', 'Clubs'))

      @fifteen_3 = Counter.new([Card.new('J', 'Hearts'),
                                Card.new('2', 'Hearts'),
                                Card.new('3', 'Hearts'),
                                Card.new('K', 'Hearts')],
                               Card.new('Q', 'Clubs'))

      @fifteen_all_cards = Counter.new([Card.new('A', 'Hearts'),
                                        Card.new('A', 'Spaids'),
                                        Card.new('A', 'Clubs'),
                                        Card.new('2', 'Hearts')],
                                       Card.new('Q', 'Clubs'))

      @fifteen_separate_combos = Counter.new([Card.new('6', 'Hearts'),
                                        Card.new('9', 'Spaids'),
                                        Card.new('8', 'Clubs'),
                                        Card.new('7', 'Hearts')],
                                       Card.new('Q', 'Clubs'))

    end

    it 'has a score of 2 with one fifteen combo' do
      expect(@fifteen.fifteen_score).to eq 2
    end

    it 'has a score of 4 with two fifteen combos' do
      expect(@fifteen_2.fifteen_score).to eq 4
    end

    it 'has a score of 6 with three fifteen combos' do
      expect(@fifteen_3.fifteen_score).to eq 6
    end

    it 'should have 2 points if the total is 15' do
      expect(@fifteen_all_cards.fifteen_score).to eq 2
    end

    it 'should have 4 points for two separate 15s' do
      expect(@fifteen_separate_combos.fifteen_score).to eq 4
    end
  end
end




#
#context 'when counting hands' do
#  should 'have a hand to count' do
#
#  end
#
#  should 'count all 15s as 2 points' do
#
#  end

#
#  should 'count a flush as a one point per card' do
#    should 'be 4 cards of the same suit in your hand' do
#      should 'add one point if the community card is the same suit' do
#
#      end
#    end
#  end
#end
#
#context 'when counting the crib' do
#  should 'count a flush only if all 5 cards are the same suit' do
#
#  end
#end
