# Description
# Write a method that calculates and returns the index of the first 
# Fibonacci number that has the number of digits specified as an argument. 
# (The first Fibonacci number has index 1.)

# P
# Input: integer, length of digits in number => if 3, length >= 100
# Output: integer, number of previous integers in Fib seq till the first number of input length
# Explicit: calculate digits till the first number of input length and return the number of
# previous numbers in sequence including the the first number of input length.

# E
# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847

# 1 1
# 1 + 1 = 2
# 1 + 2 = 3
# 2 + 3 = 5

# 2 => 1 1 2 3 5 8 13 # 7
# 3 => 1 1 2 3 5 8 13 21 34 55 89 144 # 12
# 4 => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597] # 17
# 5 => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946] # 21
# 6 => # 26

# D
# Use converting to string to determine the length of numbers.

# A
# 1. Define two first numbers in sequence and assign to variables.
# 2. Assign a variable for the next number in sequence to zero, to hold next number.
# 3. To compute the index of the first number of required length, create new variable to count every iteration.
# The counter should start from 2 since we defined first two numbers in sequence.
# 4. Sum first two numbers and assign to a variable of the next number.
# 5. Reassign first number variable to the value of second.
# 6. Reassign second number variable to the value of the next computed number.
# 7. Repeat these steps while the next computed number has the required by input integer length.
# 8. Check the length of number by converting to string and defining its size.
# 9. If iteration is ended, return the index of first number of required length.

# C
def find_fibonacci_index_by_length(length_of_num)
  first = 1
  second = 1
  third = 0
  counter = 2
  while third.to_s.size != length_of_num
    third = first + second
    first = second
    second = third
    counter += 1
  end
  counter
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

