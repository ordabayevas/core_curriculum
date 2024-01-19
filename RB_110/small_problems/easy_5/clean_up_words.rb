# Description
# Given a string that consists of some words (all lowercased) 
# and an assortment of non-alphabetic characters, 
# write a method that returns that string with all of the non-alphabetic characters 
# replaced by spaces. If one or more non-alphabetic characters occur in a row, 
# you should only have one space in the result (the result should never have 
# consecutive spaces).

# P
# Input: string with digits and alphabetic letters
# Output: string with only alphabetic letters and spaces instead of digits
# Explicit:
# - input is all lowercased
# - remove all digits and replace with spaces
# - no consecutive spaces allowed, two or more digits should be replaced by only 1 space
# Implicit:
# - spaces should be preserved
# - if digits followed by space by words, they all together should be 1 space only
# - new string

# E
# cleanup("---what's my +*& line?") == ' what s my line '
# cleanup('a1b#2c' --> 'a b c')

# D
# - create an array of string alphabetic letters in lower case.
# - convert input to array
# - use iteration and transformation
# - create an empty array to store new array
# - create a temporary variable to store consecutive digits

# A
# - create a constant variable with lowercased letters
# - write a method that takes a string
# - create an empty string to store new string without digits
# - iterate every character of string
#   - if character included to our array of letters, then add this character to empty string
#     - if not, return space
#       - if the last element of new string is space, do not add anything, go to the next
# - return string


# a = 'a1b#2c'
# b = ''
# a.each_char do |char|
#   if alphabet.include?(char)
#     b << char
#   else
#     if b[-1] == ' '
#       next
#     end
#     b << ' '
#   end
# end

# C
ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

def cleanup(string)
  new_string = ''
  arr2 = string.each_char do |letter|
    if ALPHABET.include?(letter)
      new_string << letter
    else
      if new_string[-1] == ' '
        next
      end
      new_string << ' '
    end
  end
  new_string
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup('a1b#2c') == 'a b c'