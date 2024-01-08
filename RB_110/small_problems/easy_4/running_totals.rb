# Description
# Write a method that takes an Array of numbers, 
# and returns an Array with the same number of elements, 
# and each element has the running total from the original Array.

# Questions: what is the running total? 
# the output array is the same mutated array or a new array?
# Answer 1: A running total is the sum of all values in a list up to and 
# including the current element. 
# Thus, the running total when looking at index 2 of the 
# array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), 
# while the running total at index 3 is 47 (14 + 11 + 7 + 15).

# P
# Input: array
# Output: array
# Explicit requirements: 
#   - write a method with one array parameter, 
#   which returns an array with the same number of elements 
#   as an array which passed as an argument to a method. 
#   - Every element in returning array should be a sum of previous elements and 
#   element itself. Thus, first element is always the same as in the original array.
# 0 + first element = first element
# [1, 2, 3] ---> [1, 3, 6]
# [2, 5, 13] ---> [2, 7, 20]
# Implicit: 
#   - return new array.
#   - if input is an empty array, output is an empty array.


# E
# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# D
# the input and the output are arrays with same number of elements.
# for creating an array with running sum from the original array we should preserve the input,
# and create a new array. Changing an original array while iterating may not work.

# A
# 1. Define a method 'running_total()', with parameter 'input_array'.
# 2. Create a new variable 'sum' and assign to 0.
# 3. Iterate with method 'map' through each element in 'input_array' and add the iterated element to 'sum'.
# 4. The new return array with transformed elements assign to a new variable 'new_array'.
# 5. Return the 'new_array'.

# C
# def running_total(input_array)
#   sum = 0
#   new_array = input_array.map do |num|
#                 sum += num
#               end
# end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []

# Further Exploration
# Try solving this problem using Enumerable#each_with_object 
# or Enumerable#reduce (note that Enumerable methods can be applied to Arrays).
def running_total(input_array)
  sum = 0
  input_array.each_with_object ([]) do |num, array|
    sum += num
    array << sum
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# using #reduce
# def running_total(numbers)
#   total = 0
#   numbers.reduce([]) { |result, number| result << total += number }
# end