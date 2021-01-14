class Encryption
  attr_reader :message, :key, :date

  def initialize (message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def encryption_shifts
    encryption_shifts = {A: 0, B: 0, C: 0, D: 0}
    encryption_shifts.each_with_index do |(alpha, shift_number), index|
      encryption_shifts[alpha] = ((@key[index,2].to_i) + offset(index-4))
    end
    encryption_shifts
  end

  def offset(x)
    (date.to_i * date.to_i).to_s[x].to_i
  end

end
