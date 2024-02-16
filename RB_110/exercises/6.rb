# Longest vowel chain 

=begin
Longest vowel chain
The vowel substrings in the word codewarriors are o,e,a,io. 
The longest of these has a length of 2. 
Given a lowercase string that has alphabetic characters only and no spaces, 
return the length of the longest vowel substring. Vowels are any of aeiou.

=end

# Input: string
# Output: integer, number of the longest consecutive vowel letters in a string

# - create an array or string with vowel letters and assign to constant
# - write a method that takes a string
# - create an empty array
# - create a temporary variable and assign to empty string
# - iterate over every character
# - if character is in the Vowels, add to a temporary variable:
#   - check the next letter is in Vowels too or not, add to variable while true, check until false
#   - if false, add variable value to array, then assign to empty string again
# - after iteration, compare vowels by length
# - return the longest
require 'pry'
require 'pry-byebug'

VOWELS = ['a', 'e', 'i', 'o', 'u']

def solve(string)
  array = []
  temp = ''
  string.each_char do |char|
    # binding.pry
    if VOWELS.include?(char)
      temp << char
    else
      if !temp.empty?
        array << temp.size
      end
      temp = ''
    end
  end
  array << temp.size
  array.max
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

# 1. Do not forget about add the last value of temp after iteration
# 2. Do not forget to check if temp is empty or not before adding to array