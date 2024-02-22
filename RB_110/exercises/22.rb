# Find the Mine!
=begin
You've just discovered a square (NxN) field and you notice a warning sign. 
The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns 
the location of the mine. The mine is represented as the integer 1 in the 2D array. 
Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array (Tuple<int, int> in C#) 
where the first element is the row index, and the second element is the column 
index of the bomb location (both should be 0 based). All 2D arrays passed into your 
function will be square (NxN), and there will only be one mine in the array.
=end

# P
# Input: nested array
# Output: array with two integers

# Explicit:
# - take a nested array with subarrays where elements are 0 and 1
# - find a 1
# - return the location of with two integer in array, where integers are the way to retrieve the int 1

# E
# mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]

# D
# Create a new array to contain the result.

# A
# - write a method with 1 arg
# - create a new empty array
# - iterate over nested array with index where block parameter each subarrray
#   - if subarray include 1, add it's index to new array
#     - iterate over elements with index in subarray
#       - if element == 1, add it's index to new array
# - return new array

# C
def mineLocation(nested_array)
  new_arr = []
  nested_array.each_with_index do |sub, i|
    if sub.include?(1)
      new_arr << i
      sub.each_with_index do |num, idx|
        if num == 1
          new_arr << idx
        end
      end
    end
  end

  new_arr
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
