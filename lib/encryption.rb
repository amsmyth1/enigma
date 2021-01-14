class Encryption
  attr_reader :message, :key, :date

  def initialize (message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def encryption_shifts
    encryption_shifts = {}
    encryption_shifts[:A] = ((@key[0,2].to_i) + offset(-4))
    encryption_shifts[:B] = ((@key[1,2].to_i) + offset(-3))
    encryption_shifts[:C] = ((@key[2,2].to_i) + offset(-2))
    encryption_shifts[:D] = ((@key[3,2].to_i) + offset(-1))
    encryption_shifts
  end

  def offset(x)
    (date.to_i * date.to_i).to_s[x].to_i
  end

end
