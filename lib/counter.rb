load 'game.rb'

class Counter
  attr_accessor :hand, :top_card, :type

  #@top_card = nil
  #@hand = []

  def initialize(hand, top_card, type='player')
    self.hand = hand
    self.top_card = top_card
    self.type = type
  end

  def calculate_score
    pairs_score + flush_score + fifteen_score + right_jack_score + runs_score
  end

  def pairs_score
    score = 0
    all_cards = hand << top_card
    #numbers = all_cards.map{|card| card.number}

    numbers = []
    all_cards.each do |card|
      numbers.push card.number
    end

    remaining_numbers = numbers

    numbers.each do |card_number|
      old_count = remaining_numbers.size #5-1
      new_count = (remaining_numbers - [card_number]).size #5-?

      number_of_cards = old_count - new_count
      if(number_of_cards > 1)
        #pair found
        score += 2 if number_of_cards == 2
        score += 6 if number_of_cards == 3
        score += 12 if number_of_cards == 4
      end

      remaining_numbers = remaining_numbers - [card_number]
    end

    return score
  end

  def flush_score
    hearts = 0
    diamonds = 0
    clubs = 0
    spaids = 0
    all_cards = hand << top_card
    all_cards.each do |card|
      case card.suit
        when 'Hearts'
          hearts += 1
        when 'Diamonds'
          diamonds += 1
        when 'Clubs'
          clubs += 1
        when 'Spaids'
          spaids += 1
        else
          puts 'The card suit does not match'
      end
    end

    score = [hearts, diamonds, clubs, spaids].max
    if type == 'crib' and score == 4
      score = 0
    end
    score
  end

  def fifteen_score
    #Todo need to get this working
    score = 0
    all_cards = hand << top_card
    all_numbers = all_cards.map{|c| c.value}

    #check 2 card combos
    other_numbers = all_numbers
    score_to_add = 0
    all_numbers.each do |number|
      numbers_to_check = other_numbers - [number]
      numbers_to_check.each do |other_number|
        score_to_add += 2 if other_number + number == 15
      end
    end
    score += score_to_add/2 # add half the score for counting the same card twice

    #check 3 card combos
    all_numbers.each do |number1|
      numbers_to_check = other_numbers - [number1]
      numbers_to_check.each do |number2|
        final_numbers_to_check = numbers_to_check - [number2]
       score_to_add += 2 if final_numbers_to_check.inject(:+) == 15
      end
    end
    score += score_to_add/2 # add half the score for counting the same combination twice

    #check 4 card combos
    all_numbers.each do |number|
      numbers_to_check = other_numbers - [number]
      score_to_add += 2 if numbers_to_check.inject(:+) == 15
    end

    #check 5 card combos
    score += 2 if all_numbers.inject(:+) == 15

    score
  end

  def right_jack_score
    crib_suit = top_card.suit
    score = 0
    hand.each do |card|
      if card.number == 'J' and card.suit == crib_suit
        score = 1
      end
    end

    return score
  end

  def runs_score
    #todo need to get this done
  end
end
