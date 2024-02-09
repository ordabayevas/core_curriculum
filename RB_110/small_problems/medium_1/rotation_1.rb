# Write a method that rotates an array by moving the first element to the end of the array.
# The original array should not be modified.
# Do not use the method Array#rotate or Array#rotate! for your implementation.

# P
# Input: array
# Output: array with moved first element to the end
# Explicit requirements:
# - take an array of elements
# - change the order of elements: the first element is moved to the end, others are remained the order
# - do not modify the original
# - do not use the built-in methods

# E
# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

# D
# Create a new array for newly ordered elements.

# A
# - write a method that takes 1 arg
# - create a new empty array
# - access its elements through iteration
# - elements from 1 to -1 add to a new array
# - then add the first array element

# def rotate_array(array)
#   new_array = []
#   array[1..-1].each { |el| new_array << el }
#   new_array << array[0]
#   new_array
# end

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# Further Exploration
# For strings:
# def rotate_string(string)
#   new_string = []
#   string[1..-1].each_char { |char| new_string << char }
#   new_string << string[0]
#   new_string.join
# end

# For integers:
# def rotate_integers(integer)
#   new_int_array = integer.digits.reverse
#   new_array = []
#   new_int_array[1..-1].each { |el| new_array << el.to_s }
#   new_array << new_int_array[0].to_s
#   new_array.join.to_i
# end

# def rotate(int)
#   (int.to_s[1..-1] + int.to_s[0]).to_i
# end
# p rotate(1975) == 9751
