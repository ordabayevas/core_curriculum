# Description
# Write a method that takes one argument, a positive integer, 
# and returns a list of the digits in the number.

# P
Input: positive integer
Output: array of digits
Explicit: method that takes a positive integer, and converts it to array of digits 
of this integer.
Implicit:

# E
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# D
convert to a string object.
string convert to array.
iterate over array an convert to a string.

# A
- write a method that takes a pos integer
- convert integer to string and split
- string to array 
- iterate over array and convert to integer every element
- return array

# C
def digit_list(int)
  array_str_digits = int.to_s.split('')
  array_str_digits.map do |str_num|
    str_num.to_i
  end
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# def digit_list(number)
# digits = []
# loop do
#   number, remainder = number.divmod(10)
#   digits.unshift(remainder)
#   break if number == 0
# end
# digits
# end