require 'pry'
require 'pry-byebug'

# Write a method that takes an integer as argument, and returns the maximum 
# rotation of that argument. You can (and probably should) use 
# the rotate_rightmost_digits method from the previous exercise.
# Note that you do not have to handle multiple 0s.

# P
# Input: integer
# Output: the rotated integer
# Explicit:
# original -> 735291
# first, move 1 num to the end -> 35291 7
# second, now 1 num is fixed and other part is rotated -> 3 2917 5
# third, fix 2 first num and rotate the other part -> 32 175 9
# fourth, fix 3 first num and rotate the other part -> 321 59 7
# fifth, fix 4 first num and rotate the other part -> 3215 79
# so for the 6 digit number we need to rotate 5 times, fix nums from 0 to 4.
# Implicit:
# If 0 is leading, it drops.

# E
# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845

# D
# Convert integer to a string or array.

# A
# - write a method with 1 argument
# - convert integer to a string
# - iterate string size times
#   - rotate with rotate_string
#   - fix the first 1 num which is index 0 and rotate from 1..-1
#   - fix the first 2 nums which are indices 0, 1 and rotate from 2..-1
#   - fix the first 3 nums which are indices 0, 1, 2 and rotate from 3..-1
#   - fix the first 4 nums which are indices 0, 1, 2, 3 and rotate from 4..-1
# - convert to integer

# C
# first option

# def rotate(int)
#   int[1..-1] + int[0]
# end

# def max_rotation(integer)
#   string_int = integer.to_s
#   string_int.size.times do |index|
#     rotated_part = string_int.slice!(index..-1)
#     string_int = string_int + rotate(rotated_part)
#   end
#   string_int.to_i
# end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845


# second option
# def rotate_rightmost_digits(integer, last_digits_num)
#   string_int = integer.to_s
#   last_part = string_int.slice!(-last_digits_num..-1)
#   #binding.pry
#   rotated_digits = rotate(last_part)
#   (string_int + rotated_digits)#.to_i
# end

# def max_rotation(integer)
#   index = integer.to_s.size
#   index.times do |_|
#     integer = rotate_rightmost_digits(integer, index)
#     index -= 1
#   end
#   integer.to_i
# end

# p max_rotation(735291) == 321579
# p max_rotation(10005)
# p max_rotation(8_703_529_146) == 7_321_609_845

# Further exploration
# There is an edge case in our problem when the number passed in as the argument 
# has multiple consecutive zeros. Can you create a solution that preserves zeros?

# 1005
# 0051
# 0510
# 0501

def rotate_rightmost_digits(integer, last_digits_num)
  string_int = integer.to_s
  last_part = string_int.slice!(-last_digits_num..-1)
  #binding.pry
  rotated_digits = rotate(last_part)
  (string_int + rotated_digits) # moved to_i
end

def max_rotation(integer)
  index = integer.to_s.size
  index.times do |_|
    integer = rotate_rightmost_digits(integer, index)
    index -= 1
  end
  integer.to_i # here
end

p max_rotation(10005)