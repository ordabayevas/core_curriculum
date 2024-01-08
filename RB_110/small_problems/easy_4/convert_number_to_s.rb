# Description
# Write a method that takes a positive integer or zero, 
# and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, 
# such as Integer#to_s, String(), Kernel#format, etc. 
# Your method should do this the old-fashioned way and construct the string 
# by analyzing and manipulating the number.

# P
# Input: 0 or positive integer
# Output: string
# Explicit requirements: write a method with 1 parameter.
# Convert a positive number or 0 to a string without using Integer#to_s, String(), Kernel#format, etc.

# E
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# D
# Create a hash and make a keys are numbers from 0 to 9, and values string digits from '0' to '9'.
# Iterate through hash to change the integer input digits to string representation.
# Create an empty array to contain new updated values.
# Use string concatenation '+' or method 'join'.

# A
# 1. Create an empty hash.
# 2. Use method 'times' to iterate and create integer keys from 0 to 9.
#   - 'times' block's parameter use as a key, and assign to string interpolation to convert parameter to a string.
# 4. Define a method 'integer_to_string()' with one parameter (integer).
# 5. Convert integer to an array with 'digits' and 'reverse'.
# 6. Iterate thorugh array with 'map' and transform every element of array to string representation.

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

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Further Exploration
# One thing to note here is the String#prepend method; 
# unlike most string mutating methods, 
# the name of this method does not end with a !. 
# However, it is still a mutating method - it changes the string in place.

# This is actually pretty common with mutating methods that do not have a 
# corresponding non-mutating form. chomp! ends with a ! because the non-mutating 
# chomp is also defined. prepend does not end with a ! because there is 
# no non-mutating form of prepend.

# How many mutating String methods can you find that do not end with a !. 
# Can you find any that end with a !, but don't have a non-mutating form? 
# Does the Array class have any methods that fit this pattern? How about the Hash class?