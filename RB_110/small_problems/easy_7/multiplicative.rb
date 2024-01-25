# Description
# Write a method that takes an Array of integers as input, multiplies 
# all the numbers together, divides the result by the number of entries in the Array, 
# and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

# P
# Input: array with numbers
# Output: number with three decimal places as a string
# Explicit: 
# - take an array of numbers and multiplicate them together, then divide by number of numbers.
# - print the result with three decimal. 
# - array is always non-empty.

# E
# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# D
# Create a variable to hold a result of multiplication.

# A
# - write a method that takes an array
# - multiplicate all numbers in array and assign to a new variable
# - divide this multiplication result by array length in float.
# - round till 3 decimal
# - print this number

# C
def show_multiplicative_average(array)
  mult_result = array.inject(:*)
  average = mult_result / array.size.to_f
  sprintf("%#.3f", average)
end

show_multiplicative_average([3, 5])