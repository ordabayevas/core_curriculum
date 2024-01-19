# Description
# Write a method that takes an Array, and returns a new Array 
# with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the 
# method you wrote in the previous exercise.

# P
# Input: array
# Output: new array with reversed elements
# Explicit: reverse all elements of input array and return new array. 
# - do not use the built-in methods
# - do not use the previous written method
# Implicit: if empty, return empty

# E
# reverse([1,2,3,4]) == [4,3,2,1]          # => true
# reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# reverse(['abc']) == ['abc']              # => true
# reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# list.object_id != new_list.object_id  # => true
# list == [1, 3, 2]                     # => true
# new_list == [2, 3, 1]                 # => true

# D
# Create a new array to hold modifies elements.

# A
# 1. Write a method that takes an array
# 2. create a new empty array
# 3. create a loop
# 4. while new array size is not equal to original array
# 5. add elements from array to new array starting from the end
# 6. return new Array

# C
def reverse(array)
  reversed = []
  index = -1
  while reversed.size != array.size
    reversed << array[index]
    index -= 1
  end
  reversed
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# REVERSE_EACH ---> ONLY FOR ARRAYS
# def reverse(array)
#   result_array = []
#   array.reverse_each { |element| result_array << element }
#   result_array
# end