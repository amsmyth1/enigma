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

  def decryption_shifts
    decryption_shifts = {A: 0, B: 0, C: 0, D: 0}
    decryption_shifts.each_with_index do |(alpha, shift_number), index|
      decryption_shifts[alpha] = ((@key[index,2].to_i) + offset(index-4))
    end
    decryption_shifts
  end

  def offset(x)
    (date.to_i * date.to_i).to_s[x].to_i
  end

end
