# P
# - convert num to octal
# - do not use any built-in methods

# E
# 233
# 3 * 8**0 + 3 * 8**1 + 2 * 8 ** 2 = 155

# A
# - create class Octal
# - take num and save the num as instance var
# - method to convert to_s and reverse
# - iterate over string num and add every loop result to array
# - by every iteration take 1 num and convert to_i and multiply by 8 in index power
# - iterate num size times
# - return the sum of array

class Octal
  attr_reader :num

  def initialize(num)
    if valid?(num) 
      @num = num
    else
      @num = '0'
    end
  end

  def valid?(n)
    n.match?(/[8-9a-z]/i)
  end

  def formated
    num.reverse
  end

  def to_decimal
    result = 0
    formated.size.times do |idx|
      calc = formated[idx].to_i * (8**idx)
      result += calc
    end
    result
  end
end

# p Octal.new('8').to_decimal



