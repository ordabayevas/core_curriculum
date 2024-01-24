# Description
# Write a method that combines two Arrays passed in as arguments, 
# and returns a new Array that contains all elements from both Array arguments, 
# with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they 
# have the same number of elements.

# P
# Input: 2 Arrays
# Output: united new Array of these two arrays elements
# Explicit:
# - take two arrays and combine their elements in one new array.
# - elements should combine one by one from every array.
# - assume that both input arrays are not empty.
# - assume that both arrays have the same length.

# E
# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# D
# Create a new array to hold all elements.

# A
# - write a method that takes 2 arguments
# - create a new array to store elements
# - create a new variable index to update the indices
# - while new array's length is not equal to the doubled size of the first array do:
#   - push the first array's index element to the new array
#   - push the second array's index element to the new array
#   - increment index by 1
# - return new array

# C
def interleave(first_arr, second_arr)
  total_arr = []
  index = 0
  while total_arr.size != (first_arr.size * 2)
    total_arr.push(first_arr[index], second_arr[index])
    index += 1
  end
  total_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

