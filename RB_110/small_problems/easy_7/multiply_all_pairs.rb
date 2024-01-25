# Description
# Write a method that takes two Array arguments in which each Array 
# contains a list of numbers, and returns a new Array that contains the product 
# of every pair of numbers that can be formed between the elements of the two Arrays. 
# The results should be sorted by increasing value.
# You may assume that neither argument is an empty Array.

# P
# input: two non-empty arrays with numbers
# output: one sorted array with all multiplicated combinations
# Explicit: 
# - take two arrays and every element of first, multiplicate with every element of the second
# - all products store in one array
# - sort all products in array by increasing value
# Implicit:
# - arrays are not the same length.
# - the new array should be the length of doubled size of the longest array

# E
# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
# [8, 6, 2, 4, 16, 12, 4, 8]

# D
# Create a new array to hold new values.

# A
# - write a method that takes two arguments
# - iterate over elements of the first array, create first loop
# - every element of the first should be multiplicated by every of the second, create second loop
#   1*3, 1*4, 1*5, 2*3, 2*4, 2*5
#   [1, 2] * [3, 4, 5] ---> [3, 4, 5, 6, 8, 10]
# - assign the result of two loops to variable arr3
# - the given result of numbers put in one array
# - sort and return this array

# C
def multiply_all_pairs(arr1, arr2)
  arr3 = arr1.map do |el|
    arr2.map do |num|
      el * num
    end
  end
  arr3.flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# def multiply_all_pairs(array_1, array_2)
#   array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
# end
