require './lib/cipherable'

class Encryption
  include Cipherable

  attr_reader :message, :key, :date

  def initialize (message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypted_message
    encrypted_message_characters = []
    @message.downcase.chars.each_with_index do |character, index|
      encrypted_index = ((@alphabet.find_index(character)) + (shifts[(alpha(character, (index + 4)))]))
      encrypted_message_characters << (@alphabet[(encrypted_index % 27)])
    end
    encrypted_message_characters.join
  end
end
