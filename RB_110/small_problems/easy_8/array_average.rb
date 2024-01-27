# Write a method that takes one argument, an array containing integers, 
# and returns the average of all numbers in the array. 
# The array will never be empty and the numbers will always be positive integers. 
# Your result should also be an integer.

# Don't use the Array#sum method for your solution - see if you can solve 
# this problem using iteration more directly.

# P
# Input: array of integers
# Output: average number of these integers
# Explicit: 
# - find the average of all numbers in array. 
# - Do not use array#sum method.
# - all numbers are positive.

# E
# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# D
# Use the same array.

# A
# - take an array of integers
# - create a variable sum and assign to 0
# - iterate over every number and add them to each other and reassign the value of sum
# - divide the sum by size of array
# - return the result

# C
def average(array)
  sum = array.inject {|sum, n| sum + n }
  sum / array.size.to_f
end

puts average([1, 6]) # == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) # == 25
puts average([9, 47, 23, 95, 16, 52]) # == 40