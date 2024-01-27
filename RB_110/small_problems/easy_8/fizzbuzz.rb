# Write a method that takes two arguments: the first is the starting number, 
# and the second is the ending number. Print out all numbers from the starting 
# number to the ending number, except if a number is divisible by 3, print "Fizz", 
# if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 
# 3 and 5, print "FizzBuzz".

# P
# Input: two numbers: staring and ending numbers
# Output: printed range numbers, but with some numbers changed to strings
# Explicit:
# - take two numbers start and end 
# - check every number in this range if they are divisible by 3 or 5.
# - if number divisible by 3, change this number to string 'Fizz'
# - if number divisible by 5, change this number to string 'Buzz'
# - if number divisible by 3 and by 5, print 'FizzBuzz'
# Implicit:
# - start and end numbers also should be check for divisibility and return.

# E
# fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# D
# Create an array of this range of two numbers.

# A
# First model:
# - take two numbers and make a range of numbers
# - convert range of numbers to array
# - iterate over array, and check every number for divisibility:
#   - if divisible by 3 and 5 print 'FizzBuzz'
#   - if divisible by 3 and not by 5 print 'Fizz'
#   - if divisible by 5 and not by 5 print 'Buzz'
#   - else print the number itself

# C
def fizzbuzz(num1, num2)
  array = (num1..num2).to_a
  new = array.map do |num|
    if (num % 3 == 0) && (num % 5 == 0)
      'FizzBuzz'
    elsif num % 3 == 0
      'Fizz'
    elsif num % 5 == 0
      'Buzz'
    else
      "#{num}" # not necessary to use interpolation because [1, 2].join(', ') -> "1, 2"
    end
  end
  puts new.join(', ')
end

fizzbuzz(1, 15)


