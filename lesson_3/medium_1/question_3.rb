def factors(number)
  divisor = number
  factors = []
  while divisor != 0
    factors << number / divisor if (number % divisor == 0) && (number > 0)
    divisor -= 1
  end
  factors
end

# LS solution
while divisor > 0
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end

# example
p factors(10)