# Backspaces in string
=begin
Assume "#" is like a backspace in string. This means that string "a#bc#d" 
actually is "bd"
Your task is to process a string with "#" symbols.

Examples
"abc#d##c"      ==>  "ac"
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""

P
Input: string with grill sign
Output: processed string

E
"abc##d######"  ==>  'a b c # #' deletes 'b c', 'a d # # # # # #' deletes 'a d', '####'

D
Use string or array.

A
- FIND first grill sign
  - covert string into array of chars
  - iterate over string with index
  - go to next while current char is not a grill sign
- REMOVE 1 sign before grill sign and grill sign itself
  - if grill sign, remove 1 char before grill sign and current grill sign from array
  - repeat till no chars are left or no grill signs
- RETURN the last characters in a string
  - return the array as a string
=end
require 'pry'
require 'pry-byebug'

# C
# def clean_string(string)
#   array = string.chars
#   string.each_char.with_index do |char, i|
#     #binding.pry
#     if char == '#'
#       p array[0..i-1][-1]
#     end
#   end
#   array
# end

# A
# - REMOVE 1 char for 1 '#'
#   - create a new variable with empty array to hold letters
#   - while letters, add them to array
#   - if '#', remove last letter from array
#   - if '#' and no letters in an array, go to next char
# - RETURN letters in a string that last after removing
#   - return lasted letters in array
#   - convert to string

def clean_string(string)
  letters = []
  string.each_char do |char|
    # binding.pry
    if char == '#' && !letters.empty?
      letters.pop
    elsif char == '#' && letters.empty?
      next
    else
      letters << char
    end
  end
  letters.join
end

# p clean_string('abc#d##c') #== "ac"
# p clean_string('abc####d##c#') #== ""
# p clean_string('abc##d######')
p clean_string('831####jns###s#cas/*####-5##s##6+yqw87e##hfklsd-=-28##fds##')