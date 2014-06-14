class Enc
  attr_accessor :message

  def initialize(message)
    self.message = message
  end

  def encode
    chars = convert_to_chars(message)
    @message = scramble(chars)
    puts @message
  end

  def decode
    chars = convert_to_chars(message)
    @message = fix(chars)
    puts @message
  end

  private

  def letters
    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ', '.', ',']
  end

  def key
    7
  end

  def hash
    Hash[letters.map.with_index.to_a]
  end

  def convert_to_chars(str)
    message.split('')
  end

  def scramble(chars)
    scrambled_array = []
    chars.each do |c|
      index = @@hash[c]
      if index < 22
        new_letter = letters[index + key]
      else
        new_index = (index + key) % 29
        new_letter = letters[new_index]
      end
      scrambled_array << new_letter
    end
    scrambled_array.join('')
  end

  def fix(chars)
    scrambled_array = []
    chars.each do |c|
      index = @@hash[c]
      if index > 22
        new_letter = letters[index - key]
      else
        new_index = (index - key) % 29
        new_letter = letters[new_index]
      end
      scrambled_array << new_letter
    end
    scrambled_array.join('')
  end

end