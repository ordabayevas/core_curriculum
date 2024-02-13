# Find all pairs 

=begin
Find all pairs

You are given array of integers, your task will be to count all pairs 
in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)
=end

# Input: array of integers
# Output: integer, number of pairs
# If empty or no pairs in array - return zero

# - write a method with 1 array arg
# - create a variable 'pairs counter' and assign to zero
# - create an array with unique elements from array
# - iterate through unique elements
# - check if count of iterating integer in original array is equal or more than 2
# - delete count number by two -> this will give us the whole number of pairs
# - assign result to a variable
# - return the 'pairs counter'

def pairs(array)
  pairs_counter = 0
  unique_elements = array.uniq
  unique_elements.each do |num|
    if array.count(num) >= 2
      pairs_num_of_int = array.count(num) / 2
      pairs_counter += pairs_num_of_int
    end
  end
  pairs_counter
end


p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
