# Triple trouble
=begin
Write a function triple_double(num1, num2) which takes numbers num1 and num2 and 
returns 1 if there is a straight triple of a number at any place in num1 and 
also a straight double of the same number in num2.

If this isn't the case, return 0

Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

P
Input: two nums
Output: 1 or 0

Rules:
- find a digit which repeats 3 times consecutively in num 1
- then find the same digit in num 2
- if it repeats twice in num 2, return 1 for the method
- if not, return 0

E
666789, 12345667 --> 666 in num 1, 66 in num 2 --> return 1
12345, 12345 --> no triple in num 1

D
Use string.

A
- TRANSFORM given nums to strings
  - num1.to_s
  - num2.to_s
- FIND 3 consecutive nums in num 1
  - create a variable and assign to empty array
  - iterate over num1
  - if element == element +1 == element + 2
  - add num to array
- FIND 2 consecutive nums in num 2
  - iterate over array from previous step
  - check if every num is in the num2 string in doubled
  - if true, return 1
- RETURN 0 after all iterations
=end

require 'pry'
require 'pry-byebug'

# C
def triple_double(num1, num2)
  num1_str = num1.to_s
  int = []
  num1_str.each_char.with_index do |char, i|
    if char == num1_str[i + 1] && char == num1_str[i + 2]
      int << char
    end
    break if i == (num1_str.size - 2)
  end

  if !int.empty?
    num2_str = num2.to_s
    int.each do |n|
      if num2_str.include?(n+n)
        return 1
      end
    end
  end

  return 0
end

# p triple_double(12345, 12345) #== 0
# p triple_double(666789, 12345667) #== 1
# p triple_double(10560002, 100)
p triple_double(626899941204690347509683103000176,82995928452262130288340199661)


# shorter and smarter
# def triple_double(num1,num2)
#   num1 = num1.to_s
#   num2 = num2.to_s
#   10.times do |i|
#     if num1.include?(i.to_s*3) && num2.include?(i.to_s*2)
#       return 1
#     end
#   end
#   return 0
# end