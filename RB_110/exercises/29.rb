# Exponent method
=begin
Create a method called "power" that takes two integers and returns the value 
of the first argument raised to the power of the second. Return nil if the 
second argument is negative.
Note: The ** operator has been disabled.
=end

def power(num, power)
  if power >= 0
    res = 1
    power.times do |_|
      res = res * num
    end
  else 
    nil
  end
  res
end

# Examples:

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) #== nil
