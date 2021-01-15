class Decryption
  attr_reader :message, :key, :date

  def initialize (message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
                  "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
                  "y", "z", " "]
  end

end
