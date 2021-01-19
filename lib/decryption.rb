require './lib/cipherable'

class Decryption
  include Cipherable

  attr_reader :message, :key, :date

  def initialize (message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def decrypted_message
    decrypted_message_characters = []
    @message.downcase.chars.each_with_index do |character, index|
      decrypted_index = ((alphabet_index(character)) - (shifts[(alpha(character, (index + 4)))]))
      decrypted_message_characters << (alphabet[(decrypted_index % 27)])
    end
    decrypted_message_characters.join
  end
end
