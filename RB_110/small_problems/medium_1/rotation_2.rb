# Write a method that can rotate the last n digits of a number.
# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
# You may assume that n is always a positive integer.

# P
# Input: array with 2 integer arg
# Output: the integer with the given num last digits rotated
# Explicit:
# - take an array with integer and the number of last digits
# - rotate the defined number of last digits by second arg
#   - rotate means if 3 last digits should be rotated, the first one goes to the end,
#   and other two goes first in the same order
# - use a method from previous task

# E
# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917

# D
# Create a new array for new integer.

# A
# - write a method with 2 arg
# - convert integer to string
# - subtract the second arg from string size -> 6 - 3 = 3
# - slice and assign from subtraction result till the last
# - def rotate(int)
#   int[1..-1] + int[0]
# end
# - first part of string and the return value of method concatenate to each other.
# - convert to integer

# def rotate(int)
#   int[1..-1] + int[0]
# end

def rotate_string(string)
  new_string = []
  string[1..-1].each_char { |char| new_string << char }
  new_string << string[0]
  new_string.join
end

def rotate_rightmost_digits(integer, last_digits_num)
  string_int = integer.to_s
  last_part = string_int.slice!(-last_digits_num..-1)
  rotated_digits = rotate_string(last_part)
  (string_int + rotated_digits).to_i
end

p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
