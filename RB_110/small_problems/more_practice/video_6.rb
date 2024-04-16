=begin
P
Input: array of integers
Output: index

Rules:
- find the num in array where both sides sum will be equal
- return the index of this sum

E
[20, 10, -80, 10, 10, 15, 35] --> 0 => left side sum == 0 and right side sum is 0

D
begin: array
middle: integers, array
end: integer

A
- FIND the sum of left and right side of every num, excluding that num
  - iterate over every num in array
    - left side - slice from 0 till the current num index, exclusive the current index
    - right side - slice from current index + 1 till the end
    - find the sum of both arrays
    - if equal, return the current index
=end

# C
def find_even_index(array)
  array.size.times do |i|
    left = array[0...i]
    right = array[(i + 1)..-1]
    if left.sum == right.sum
      return i
    end
  end

  -1
end

p find_even_index([20, 10, -80, 10, 10, 15, 35])
p find_even_index([1, 2, 3, 4, 5, 6])
p find_even_index([20, 10, 30, 10, 10, 15, 35])