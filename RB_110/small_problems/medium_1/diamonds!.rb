# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an 
# odd integer that is supplied as an argument to the method. 
# You may assume that the argument will always be an odd integer.

# P
# Input: integer
# Output: integer num lines of asterisks, every line is ascending odd num of stars till given integer
# Explicit:
# - write a method that takes an integer
# - print this argument nums lines of asterisks
# - every line in ascending order has odd stars starting from 1:
#   - 1 line *
#   - 2 line ***
#   - 3 line *****
# - after it reached the given integer it starts to descend
# - all stars should be located in the center
# - the longest line of stars will be in the middle and equal to the given integer

# E
# diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# D
# Use strings and string interpolation.

# A
# - write a method that takes 1 argument
# - num of iterations (lines) equal to argument
# - draw a star by every iteration
# - increment stars num in line by 2
# - stop incrementing when num of stars is equal to argument
# - start descending by 2 while num of stars is not equal to 1

# C
# def ascend(num)
#   middle = num / 2 + 1
#   star_num = 1
#   middle.times do |_|
#     puts ("*" * star_num).center(num)
#     star_num += 2
#   end
# end

# def descend(num)
#   middle = num / 2
#   star_num = num - 2
#   middle.times do |_|
#     puts ("*" * star_num).center(num)
#     star_num -= 2
#   end
# end

# def diamond(integer)
#   ascend(integer)
#   descend(integer)
# end

# diamond(3)

# Further Exploration
require 'pry'
require 'pry-byebug'

def ascend(num)
  middle = num / 2
  star_num = 3
  puts '*'.center(num)
  middle.times do |_|
    puts "*#{' ' * (star_num - 2)}*".center(num)
    star_num += 2
  end
end

def descend(num)
  middle = num / 2 - 1
  star_num = num - 2
  middle.times do |_|
    puts "*#{' ' * (star_num - 2)}*".center(num)
    star_num -= 2
  end
  puts '*'.center(num)
end

def diamond(integer)
  ascend(integer)
  descend(integer)
end

diamond(5)
