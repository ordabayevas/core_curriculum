# String transformer
=begin
Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.

For example:

"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.

P
Input: string
Output: modified new string

Rules:
- take a string and change the cases
- reverse the order of words
- leave all spaces as it is

E
"Example Input" -> 

D
use an array to reverse words.

A
- TRANSFORM string to 2 arrays of words and spaces
- SELECT words from array
- TRANSFORM the letter cases from upper to down, from down to upper
- TRANSFORM the order of words
=end
require 'pry'
require 'pry-byebug'

# C

# def transformer(string)
#   spaces = []
#   temp_spaces = ''

#   string.each_char do |char|
#     if char == ' '
#       temp_spaces << char
#     elsif !temp_spaces.empty?
#       #binding.pry
#       spaces << temp_spaces
#       temp_spaces = ''
#     end
#   end

#   if !temp_spaces.empty?
#     spaces << temp_spaces
#   end
  
#   words = string.split(' ')
#   words = words.map { |word| word.swapcase }.reverse
#   spaces = spaces.reverse

#   result = ''
#   idx = 0
#   if spaces.size > words.size
#     loop do
#       result << spaces[idx] << words[idx]
#       idx += 1
#       break if idx == words.size
#     end
#     result << spaces[-1]
#   elsif spaces.size < words.size
#     #binding.pry
#     loop do
#       result << words[idx] << spaces[idx]
#       idx += 1
#       break if idx == spaces.size
#     end
#     result << words[-1]
#   else
#     if string[0] == ' '
#       loop do
#         result << space[idx] << words[idx]
#         idx += 1
#         break if idx == space.size
#       end
#     else
#       loop do
#         #binding.pry
#         result << words[idx] << spaces[idx]
#         idx += 1
#         break if idx == spaces.size
#       end
#     end
#   end
#   result
# end

def split(string)
  words = []
  temp_word = ''

  string.each_char do |char|
    if char == ' '
      words << temp_word
      temp_word = ''
    else
      temp_word << char
    end
  end
  words << temp_word
  words
end

def transformer(string)
  split(string).map {|word| word.swapcase}.reverse.join(" ")
end

p transformer('Eptdt Drwnu Yxaqj Xasauq Hnim Rsz Vktgd')