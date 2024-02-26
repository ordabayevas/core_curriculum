# Longest alphabetical substring
=begin
Find the longest substring in alphabetical order.
There are tests with strings up to 10 000 characters long so your code 
will need to be efficient.
The input will only consist of lowercase characters and will be 
at least one letter long.
If there are multiple solutions, return the one that appears first.
=end

# P
# Input: string
# Output: substring in alphabetical order, the longest
# Explicit:
# - given a string, find a substring that have an order as in alphabet
# - if next character is standing before in alphabet, substring ends
# - do not search for all substrings in a strings because of the efficiency
# - return the longest alphabetical ordered substring
# - if one letter is repeated it also a part of the substring

# Implicit:
# - if there are no substrings in alpha order, return first letter of a string

# E
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" 
# is "aaaabbbbctt".
# 'nab' => 'n' is the 14 char in alphabet, 'a' is the 1st, 'b' is the 2nd

# D
# Use an array of characters.

# A
# - take a string and CREATE an array of characters
#   - take a string and split the characters
#   - add them to a new array
#     - use the method #chars
# - FIND the elements order num in alphabet
#   - go through all elements
#     - loop with #map method through array
#   - check their nums in alphabet
#     - use method #ord
#   - return all order nums in array
#     - #map transforms the array and replace every char with num
# - FIND the nums in ascending order
#   - go through nums
#     - create a second loop with #each_with_index
#   - if next num is the bigger than current add to a variable their index or char
#     - create a temporary variable
#     - add a current num's indexed char in a string to a variable
#     - if next num is a bigger, concatenate it to the variable
#   - when the next is a lesser, add variable's value to an array
#     - add variable's value to an empty array
#   - repeat and add all subs from a string
# - RETURN the longest sub
#   - find the length of every substring and return the max
#     - sort strings by size in descending order
#     - return the first

require 'pry'
require 'pry-byebug'
# C
def longest(string)
  chars_arr = string.chars
  chars_ord_num = chars_arr.map do |char|
    char.ord
  end

  temporary = ''
  temp_arr = []
  chars_ord_num.each_with_index do |num, i|
    if (i != chars_ord_num.size - 1) && (chars_ord_num[i+1] >= num) 
      temporary << string[i]
    else
      temporary << string[i]
      temp_arr << temporary
      temporary = ''
    end
  end

  temp_arr << temporary if !temporary.empty?
  
  temp_arr.sort_by { |str| -str.size }[0]
end


p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'


# shorter solution from Codewars
# def longest(str)
#   str.chars.slice_when { |a, b| a > b }
#            .max_by(&:size)
#            .join
# end