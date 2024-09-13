require 'pry'
require 'pry-byebug'
# 1  => I
# 10  => X
# 7  => VII

# 1000=M
# 900=CM
# 90=XC

# 2000=MM
# 8=VIII

# {1 => I, 2 => II, 3 => III, 4 => IV, 5 => V, 6 => VI, 7 => VII, 8 => VIII, 9 => IX, 10 => X}
class RomanNumeral
  # ROMAN_NUMS = {1000 => 'M', 500 => 'D', 100 => 'C', 50 => 'L', 10 => 'X', 5 => 'V', 1 => 'I'}
  ROMAN_NUMS = {
  1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
  100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',
  10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I'
  }
  def initialize(input_num)
    @input_num = input_num
    @array = []
  end

  def to_roman
    ROMAN_NUMS.each_key do |key|
      while @input_num >= key
        @array << ROMAN_NUMS[key]
        @input_num -= key
      end
    end
    @array.join
  end

  # def to_roman
  #   array_with_nums = separator(@input_num)
  #   lastly = []
  #   array_with_nums.each do |num|
  #     convert_num(num, lastly)
  #   end
  #   lastly.join
  # end

  # private

  # def separator(num)
  #   separated = []
  #   divider = 10
  #   loop do
  #     adding_num = num % divider
  #     separated << adding_num
  #     num -= adding_num
  #     break if num == 0
  #     divider *= 10
  #   end
  #   separated.reverse
  # end
end

# def convert_num(num, array)# 700
#   ROMAN_NUMS.each_key do |key|
#     binding.pry
#     if num == key
#       array << ROMAN_NUMS[key]
#       break
#     elsif (key - num).abs <= (10**(key.to_s.size - 1) * 3) 
#       array << ROMAN_NUMS[key]
#       remainder = num - key
#       convert_num(remainder, array)
#     end
#   end
#   array
# end

