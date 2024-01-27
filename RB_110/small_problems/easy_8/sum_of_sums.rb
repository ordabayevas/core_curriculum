# Write a method that takes an Array of numbers and then returns the sum of the 
# sums of each leading subsequence for that Array. You may assume that the Array 
# always contains at least one number.

# P
# Input: Array of numbers
# Output: Integer, sum
# Explicit: 
# - write a method that takes array of numbers and return the sum of this numbers 
# in exact pattern: [1, 2, 3, 4, 5] == 35 # -> 1 + 1+2 + 1+2+3 + 1+2+3+4 + 1+2+3+4+5.
# - array always contains at least 1 number.

# E
# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35 # -> 1 + 1+2 + 1+2+3 + 1+2+3+4 + 1+2+3+4+5

# D
# iterate
# create a variable to hold the sum by every iteration
# use indices to reference the value

# sum = 0 + a[0] -> 0 + 1 = 1
# sum + a[1] -> 1 + 2 = 3
# sum + a[2] -> 3 + 3 = 6
# sum + a[3] -> 6 + 4 = 10
# sum + a[4] -> 10 + 5 = 15
# 1 + 3 + 6 + 10 + 15 = 35

# Use new array to store sums.

# A
# - write a method with 1 arg
# - define a variable 'sum' and assign to 0
# - iterate through every element of arg array
# - at every iteration add 'sum' to element
# - the result of previous step add to new array
# - then start next iteration and repeat
# - the sums in new array add to each other and return the value

# C
def sum_of_sums(array)
  sum = 0
  sums = array.map do |num|
    sum += num
  end
  sums.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35