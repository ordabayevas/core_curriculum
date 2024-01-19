# Description
# Write a method that takes two Arrays as arguments, and returns 
# an Array that contains all of the values from the argument Arrays. 
# There should be no duplication of values in the returned Array, 
# even if there are duplicates in the original Arrays.

# P
# Input: two Arrays
# Output: array with all values from 1 and 2 array without duplicates
# Explicit: merge all values of two input arrays in one array and delete duplicates.
# Implicit: new?

# E
# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# D
# Create a new empty array to hold all values?

# A
# 1. write a method that takes two arguments
# 2. iterate over second Array
# 3. add elements from second to the first
#   - if current element is already in the first array, skip it
#   - if not, add
# 4. return first array

# C
def merge(arr1, arr2)
  arr2.each do |el|
    if arr1.include?(el)
      next
    else
      arr1.push(el)
    end
  end
  arr1
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# def merge(arr1, arr2)
#   arr1 << arr2
#   arr1.flatten.uniq!
# end
