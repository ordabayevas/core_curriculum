# A prime number is a positive number that is evenly divisible only by itself and 1. 
# Thus, 23 is prime since its only divisors are 1 and 23. 
# However, 24 is not prime since it has divisors of 1, 2, 3, 4, 6, 8, 12, and 24. 
# Note that the number 1 is not prime.

# Write a method that takes a positive integer as an argument and returns true 
# if the number is prime, false if it is not prime.

# P
# Input: positive integer
# Output: boolean
# Explicit:
# - take an integer 
# - without any built-in methods, define is it prime or not

# C
def is_prime(integer)
  return false if number == 1
  
  num = 2.0
  root = Math.sqrt(integer).round
  while num != root
    if integer % num == 0
      return false
    else
      num += 1
    end
  end
  true
end
