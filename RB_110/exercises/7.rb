# Non-even substrings

=begin
Given a string of integers, return the number of odd-numbered substrings that can 
be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, 
a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.
=end

# P
# Input: string integer
# Output: the number of digit combinations that are odd
# Explicit: 
# - method that returns the number of odd combinations of digits
# Implicit:
# - combinations could be only consecutive

# E
# 1341 -> 1, 3, 1, 
#         13, 31, 41, 
#         341, 1341

# D
# Use an array of string digits.
# Create a new temp variable.

# A
# slice 0..0 -> 1
# slice 0..1 -> 13
# slice 0..2 -> 134
# slice 0..3 -> 1341

# slice 1..1 -> 3
# slice 1..2 -> 34
# slice 1..3 -> 341

# slice 2..2 -> 4
# slice 2..3 -> 41

# slice 3..3 -> 1
# 0, 01, 012, 0123 ...

# - write a method that takes a string
# - create a total counter of odd substrings
# - create a variable and assign to 0
# - iterate the string.size.times, iterator starts from 0
#   - iterator..(string.size - 1).times
#     - slice the string from iterator to variable
#     - add if sliced string to_i is odd
#     - variable += 1
# - return the array size

# C
def solve(string)
  total_counter = 0
  string.size.times do |first_digit|
    variable = first_digit
    first_digit.upto(string.size - 1) do |_|
      num = string.slice(first_digit..variable)
      total_counter += 1 if num.to_i.odd?
      variable += 1
    end
  end
  total_counter
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

# Codewars solution
# def solve(s) 
#   substring_array = []
#   (0..s.length-1).each do |first|
#     (first..s.length-1).each do |last|
#       substring_array << s[first..last] if s[first..last].to_i.odd?
#     end
#   end
#   substring_array.count
# end