module Cipherable
  def shifts
    shifts = {A: 0, B: 0, C: 0, D: 0}
    shifts.each_with_index do |(alpha, shift_number), index|
      shifts[alpha] = ((@key[index,2].to_i) + offset(index-4))
    end
    shifts
  end

  def offset(x)
    (date.to_i * date.to_i).to_s[x].to_i
  end

  def alpha(character, index)
    shifts = [:A, :B, :C, :D]
    alpha = shifts[(index % 4)]
  end
end
