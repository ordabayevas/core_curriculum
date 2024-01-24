# Description
# Write a method that takes an Array as an argument, 
# and reverses its elements in place; that is, mutate the Array 
# passed into this method. The return value should be the same Array object.
# You may not use Array#reverse or Array#reverse!.

# P
# Input: array
# Output: the same array with reversed elements
# Explicit: 
# - reverse the elements in array without using built-in methods. 
# - The output should be the same array, not new.
# Implicit: 
# - we should reverse only elements of array, not elements of elements.
# - if array is empty, return iself.

# E
# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true

# list = []
# reverse!(list) == [] # true
# list == [] # true

# D
# We cannot use new array to hold elements.

# A
# To modify and return the same array we can use #map and indexed assignment.
# a[0], a[1], a[2] = a[2], a[1], a[0]
# => ["c", "b", "a"]
# a
# => ["c", "b", "a"]


def reverse!(array)
  # p array.object_id
  copy = array.clone
  copy.each do |element|
    array.prepend(element)
  end
  array.uniq!
  array
  # array.object_id
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

# Launch School's solution
# def reverse!(array)
#   left_index = 0
#   right_index = -1

#   while left_index < array.size / 2
#     array[left_index], array[right_index] = array[right_index], array[left_index]
#     left_index += 1
#     right_index -= 1
#   end

#   array
# end

def reverse!(array)
  i = 0
  while i < array.size / 2
    j = -1 -i
    array[i], array[j] = array[j], array[i]
    i +=1
  end
  array
end