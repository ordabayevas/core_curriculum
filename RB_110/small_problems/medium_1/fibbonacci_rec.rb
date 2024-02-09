# Recursive methods have three primary qualities:

# They call themselves at least once.
# They have a condition that stops the recursion (n == 1 above).
# They use the result returned by themselves.

# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2
# fibonacci(4) == 3
# fibonacci(5) == 5
# fibonacci(12) == 144
# fibonacci(20) == 6765

# 1 1 2 3 5 8

# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2

#                               fib(4):
#                         fib(3) + fib(2) = 2 + 1 = 3
# fib(3) = fib(2) + fib(1) = 1 + 1 = 2    fib(2) = fib(1) + fib(0) = 1 + 0 = 1

require 'pry'
require 'pry-byebug'

def fibonacci(n) # 4
  #binding.pry
  if n >= 2
    fibonacci(n-1) + fibonacci(n-2)
  elsif n == 1 
    1
  else 
    0
  end
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
