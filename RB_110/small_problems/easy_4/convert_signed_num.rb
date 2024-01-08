# Description
# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, 
# such as Integer#to_s, String(), Kernel#format, etc. 
# You may, however, use integer_to_string from the previous exercise.

# P
# Input: positive and negative integers
# Output: string
# Explicit: write a method which converts pos and neg integers to string.
# Do not use Integer#to_s, String(), Kernel#format, etc.
# Implicit: if positive integer is given, string should be started with '+'. Only 0 has no signs.

# E
# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

# D
# Use method from previous task.
# Use conditions to distinct negative from positive and 0.

# A
# 1. Copy 'integer_to_string(integer)' method.
# 2. Define new method 'signed_integer_to_string()' with 1 parameter.
# 3. If argument is < 0, argument * (-1), add '-' to return value.
# 4. If argument is >= 0, add '+' to return value.

# C
NEW_HASH = {}
10.times do |i|
  NEW_HASH[i] = "#{i}"
end

def integer_to_string(integer)
  integer_array = integer.digits.reverse
  string_arr = integer_array.map { |int| NEW_HASH[int] }
  string = ''
  for char in string_arr
    string << char
  end
  string
end

def signed_integer_to_string(signed_int)
  if signed_int < 0
    integer_to_string(signed_int * (-1)).prepend('-')
  elsif signed_int > 0
    integer_to_string(signed_int).prepend('+')
  else
    integer_to_string(signed_int)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# Further exploration
# Refactor our solution to reduce the 3 integer_to_string calls to just one.