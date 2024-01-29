# Write a method that takes one argument, a positive integer, 
# and returns the sum of its digits.

def sum(integer)
  integer.to_s.chars.inject(0) {|sum, num| sum + num.to_i}
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
