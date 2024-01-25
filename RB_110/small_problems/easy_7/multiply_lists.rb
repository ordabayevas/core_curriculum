# Description
# Write a method that takes two Array arguments in which each Array contains 
# a list of numbers, and returns a new Array that contains the product of 
# each pair of numbers from the arguments that have the same index. 
# You may assume that the arguments contain the same number of elements.

# P
# Input: two arrays with the same number of integers
# Output: one array with multiplicated integers of the first and second arrays.
# Explicit: take two arrays and multiplicate the elements which has the same index. 
# Return the array with the same number of elements as every of given arrays.

# E
# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# D
# Create a new array to hold the new values.

# A
# - write a method that takes two arguments
# - create a new array
# - iterate over every index of the first array
# - by every iteration multiplicate elements of the first and the second array 
# with the same index.
# - push the product to the new array
# - return this array

# C
def multiply_list(arr1, arr2)
  arr3 = []
  arr1.each_index do |index|
    arr3 << (arr1[index] * arr2[index])
  end
  arr3
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further exploration
# def multiply_list(arr1, arr2)
#   arr3 = arr1.zip(arr2).map {|subarray| subarray.inject(:*)}
# end
# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]