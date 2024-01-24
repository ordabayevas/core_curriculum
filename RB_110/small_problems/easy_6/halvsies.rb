# Description
# Write a method that takes an Array as an argument, 
# and returns two Arrays (as a pair of nested Arrays) 
# that contain the first half and second half of the original Array, 
# respectively. If the original array contains an odd number of elements, 
# the middle element should be placed in the first half Array.

# P
# Input: array with elements
# Output: two arrays in one main array with first aand second half of elements in each
# Explicit:
# - convert an array to a nested array with two subarrays.
# - every subarray should contain elements from input array
#   - first subarray with first half of elements
#   - second subarray with second half of elements
#   - if number of elements is odd, the first one should have one elements more than second one
# Implicit:
# - if input is an empty array, return empty nested array with two subarrays
# - if array has only one element, place this element to the first subarray, and the second
# will be empty

# E
# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]

# D
# Create one main array, create two subarrays.

# A
# 1. Divide elements in original array on two halves
#   - divided by slicing, and return two new arrays
# 2. Place every half in array
# 3. Then place every array in one array

# How to divide?
# we can append first half of the total size of array append to a new arrayexi
# a = array.slice(0...(array.size / 2))
# b = array.slice((array.size / 2)..-1)

# C
def halvsies(array)
  middle = array.size / 2
  if array.length.odd?
    a = array.slice(0...(middle + 1))
    b = array.slice((middle + 1)..-1)
  else
    a = array.slice(0...middle)
    b = array.slice(middle..-1)
  end
  new_array = [a, b]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# def halvsies(array)
# middle = (array.size / 2.0).ceil
# first_half = array.slice(0, middle)
# second_half = array.slice(middle, array.size - middle)
# [first_half, second_half]
# end