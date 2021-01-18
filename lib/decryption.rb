require './lib/cipherable'

class Decryption
  include Cipherable

  attr_reader :message, :key, :date

  def initialize (message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
                  "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
                  "y", "z", " "]
  end

  def decrypted_message
    decrypted_message_characters = []
    @message.downcase.chars.each_with_index do |character, index|
      use_index = index + 4
      decrypted_index = ((@alphabet.find_index(character)) - (shifts[(alpha(character, use_index))]))
      decrypted_message_characters << (@alphabet[(decrypted_index % 27)])
    end
    decrypted_message_characters.join
  end
end
