# Persistent Bugger.
=begin
Write a function, persistence, that takes in a positive parameter num and 
returns its multiplicative persistence, which is the number of times 
you must multiply the digits in num until you reach a single digit.
=end

# P
# Input: positive integer
# Output: integer, number of multiplications

# Explicit:
# - write a method that multiplies all digits in a given input integer
# - if result is not 1 digit num, repeat multiplication while it is not a 1 digit num.
# - if given integer is 1 digit num, return 0.

# E
# For example:

#  persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
#                  # and 4 has only one digit

#  persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
#                   # 1*2*6=12, and finally 1*2=2

#  persistence(4) # returns 0, because 4 is already a one-digit number

# D
# Use integer conversion into string.
# Store multiplies to array.

# A
# - write a method with 1 arg 'integer'
# - convert 'integer' to string, preserve to variable
# - define the length of 'string':
#   - if 1 return 0
#   - else divide by characters and store to array
# - iterate over array and convert to int, multiply all digits in array
# - check if result is 1 digit: convert to string, and define the length
# - if not 1 digit: repeat 4 and 5 steps.
# - return the digit as integer
require 'pry'
require 'pry-byebug'

# C
def persistence(integer)
  if integer.to_s.length == 1
    return 0
  else
    counter = 0
    loop do
      counter += 1
      integer = integer.to_s.chars
      integer = integer.map { |num| num.to_i }.inject(:*)
      break if integer.to_s.length == 1
    end
  end
counter
end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
