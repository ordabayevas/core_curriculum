# Description
# Write a method named include? that takes an Array and a 
# search value as arguments. This method should return true 
# if the search value is in the array, false if it is not. 
#   You may not use the Array#include? method in your solution.

# P
# Input: array and element for search
# Output: boolean
# Explicit: search for the given element in the given array.
# Do not use #include?
# Implicit:
# If given argument is nil, and the given array is empty, the output should be false.
# Only if nil is in array it should return true.

# E
# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false

# D
# Use comparison to define inclusion.

# A
# 1. Write a method that takes two arguments: array and object.
# 2. Iterate over the given array.
#   - if current array element is equal to the given object, return true
# 3. If iteration is ended and no element in array is equal to the given object, 
# return false

# C
def include?(arr, obj)
  arr.each do |element|
    if element == obj
      return true
    end
  end
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# def include?(array, value)
#   !!array.find_index(value)
# end

# def include?(array, search_value)
#   array.any? { |element| element == search_value } 
# end