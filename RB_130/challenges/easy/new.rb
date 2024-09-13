ROMAN_NUMS = {1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D',  1000 => 'M'}
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

def convert_num(num, array)# 700
  ROMAN_NUMS.each_key do |key|
    # binding.pry
    if num == key
      array << ROMAN_NUMS[key]
      break
    elsif (key - num).abs < (10**(key.to_s.size - 1) * 3) 
      array << ROMAN_NUMS[key]
      remainder = num - key
      convert_num(remainder, array)
      break
    end
  end
  array
end

arr = []
p convert_num(4, arr)