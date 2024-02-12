# Write a method that computes the difference between the square 
# of the sum of the first n positive integers and the sum of the squares 
# of the first n positive integers.

# P
# Input: integer
# Output: integer, the difference between square sum of nums and sum of nums squares

# E
# sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150

# D
# Use range.

# A
# - write a method with 1 argument
# - take the arg and convert to range of nums from 1 up to argument
# - compute the sum of nums in range and square this result
# - compute every nums square and compute the sum
# - return the difference

def sum_square_difference(integer)
  range = (1..integer)
  square_of_sum = (range.inject(:+))**2
  sum_of_squares = range.inject {|sum, n| sum + n**2 }
  square_of_sum - sum_of_squares
end

p sum_square_difference(3) #== 22
p sum_square_difference(10) #== 2640
p sum_square_difference(1) #== 0
p sum_square_difference(100) #== 25164150

# LS solution