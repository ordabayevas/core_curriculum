# 1 Rotation
=begin
P
Write a method that rotates an array by moving the first element to the end of 
the array. The original array should not be modified.
Do not use the method Array#rotate or Array#rotate! for your implementation.

Input: array
Output: new array with rotated elements
Rules: 
- take an array with elements
- place first element from left to the end
- do not use ruby methods #rotate
- return NEW array

E
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

D
use new array.

A
- CREATE a new array and place objects
  - iterate over input array
  - add to new array starting from 1 idx
  - first append to the end
- RETURN new array
=end

# C
def rotate_array(array)
  new_arr = []
  1.upto(array.size - 1) do |i|
    new_arr << array[i]
  end
  new_arr << array[0]
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# def rotate_string(string)
#   rotate_array(string.chars).join
# end

#p rotate_string('string')

# def rotate_integers(integer)
#   rotate_string(integer.to_s).to_i
# end

# p rotate_integers(12345)

# 2 Rotation
=begin
P
Input: integer, num of rotated last nums
Output: rotated integer
Rules:
- take an integer
- rotate the last nums by given second input
- if second num is 1, do not rotate
- use the previous method
- integer is always positive

E
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

D
Use string and array.

A
- TRANSFORM the integer into string or array
  - convert integer into array of strings
    - use to_s, chars
- SELECT the part that should be rotated
  - slice the array by given second num
    - array size = 6, second input = 4, 6 - 4 = 2 -> start i = 2, length = second num
- ROTATE the selected part
  - rotate it with the method from previous task
- RETURN the integer
  - convert the array to integers
=end

# C
def rotate_rightmost_digits(integer, num)
  array_digits = integer.to_s.chars
  start_idx = array_digits.size - num
  rotated_part = array_digits.slice!(start_idx, num)
  rotated_part = rotate_array(rotated_part)
  (array_digits + rotated_part).join.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# 3 Rotation
=begin
P 
Input: integer
Output: maximum rotated integer
Rules:
- rotate firstly the whole num
- then fix the first and rotate the last part
- then fix the first two and rotate
- repeat till the last two num, rotate them and return

E
735291 -> 35291 7 -> 3 29175 -> 32 1759 -> 321 597 -> 3215 79

D
Use array.

A
- ROTATE with fixing num
  - iterate over array
  - on the first iteration delete first 0 nums and add to another array
  - on the second delete first 1 nums and add to another array
  - the last part is rotated every time with rotate_rightmost_digits
- RETURN the integer
=end

# C
# def max_rotation(integer)
#   integer.to_s.size.downto(1) do |length|
#     integer = rotate_rightmost_digits(integer, length)
#   end
#   integer
# end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

# 4 1000 lights
=begin
P
Input: 