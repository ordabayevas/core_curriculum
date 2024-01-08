# P
# Input: string
# Output: integer
# Explicit requirements:
# 1. Write a method with 1 parameter.
# 2. Convert numeric string to an integer without String#to_i and Integer() methods.
# 3. Assume all characters in string are positive and valid.

# E
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# D
# We will use conditional statements to convert every string digit to integer digit.
# Also use an array to contain new integers equal to string integers.
# To convert array with integers to integer, calculate every digit by 10 in index power, 
# then add all updated numbers to new array.
# Then sum all integers in array.

# A
# 1. Define a method 'string_to_integer' with 1 parameter 'string_number'.
# 2. Loop through every string digit.
# 2. Use case method to define which numeric object is represented by string digit.
# 3. 

# C
def string_to_integer(string_number)
  number = []
  string_number.each_char do |char|
    case char
    when '0'
      number << 0
    when '1'
      number << 1
    when '2'
      number << 2
    when '3'
      number << 3
    when '4'
      number << 4
    when '5'
      number << 5
    when '6'
      number << 6
    when '7'
      number << 7
    when '8'
      number << 8
    when '9'
      number << 9
    end
  end
integers = []
index = -1
  number.size.times do |i|
    new_num = number[index] * (10**i)
    integers << new_num
    index -= 1
  end
integers.sum
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Launch School's solution
# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 10 * value + digit } # 10 * 0 + 4 -> 4, 10 * 4 + 3 -> 43, 10 * 43 + 1 -> 431
#   value
# end

# Further Exploration
# Write a hexadecimal_to_integer method that converts 
# a string representing a hexadecimal number to its integer value.
# Example --> hexadecimal_to_integer('4D9f') == 19871