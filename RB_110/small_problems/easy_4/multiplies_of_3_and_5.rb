# Description
# Write a method that searches for all multiples 
# of 3 or 5 that lie between 1 and some other number, 
# and then computes the sum of those multiples. 
# For instance, if the supplied number is 20, 
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# P
# Input: integer
# Output: integer
# Explicit requirements: 
#   - write a method, which gives all numbers between 1 and given number, 
#   which divides by 3 or 5 without a remainder.
#   - then returns the sum of all these numbers.
#   - we may assume that given number always will be a positive integer greater than 1.

# E
# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

# D 
# 1. we need to create an array with all integer numbers between 1 and 'given number':
#   for example if given input 10 --> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# 2. then create a new variable, to contain truthy values from the first array:
#   'multipliers'
# 3. add all truthy values to the new array and sum all values inside this array
# 4. return the integer

# A
# 1. Define a method called 'multisum()' with 1 parameter 'integer'.
# 2. Create an array of numbers between 1 and 'integer' value.
# 3. Iterate over each number in this array and select those which are divided by 3 or 5.
# 4. Assign the return value of iteration and selection to the variable 'multipliers'.
# 5. Return the sum of all numbers in 'multipliers'.

# C
# def multisum(integer)
#   all_numbers = (1..integer).to_a
#   multipliers = all_numbers.select do |number|
#     (number % 3 == 0) || (number % 5 == 0)
#   end
#   multipliers.sum # sum = 0 -> multipliers.each {|num| sum += num}
# end

# p multisum(3) #== 3
# p multisum(5) #== 8
# p multisum(10) #== 33
# p multisum(1000) #== 234168

# Investigate Enumerable.reduce. 
# How might this method be useful in solving this problem? 
# (Note that Enumerable methods are available when working with Arrays.) 
# Try writing such a solution. Which is clearer? Which is more succinct?

# Note that #inject is an alias for #reduce. 
# The two methods work identically. We mostly use #reduce in our curriculum, 
# but it's worth noting that the documentation uses #inject.

def multisum(integer)
  all_numbers = (1..integer).to_a
  multipliers = all_numbers.select do |number|
    (number % 3 == 0) || (number % 5 == 0)
  end
  multipliers.inject(:+) # sum = 0 -> multipliers.each {|num| sum += num}
end

p multisum(3) #== 3
p multisum(5) #== 8
p multisum(10) #== 33
p multisum(1000) #== 234168