# Mexican Wave
=begin
In this simple Kata your task is to create a function that turns a string into 
a Mexican Wave. You will be passed a string and you must return that string 
in an array where an uppercase letter is a person standing up.

Rules
 	1.  The input string will always be lower case but maybe empty.
  2.  If the character in the string is whitespace then pass over it as if it was an empty seat.

P
Input: string in lowercase
Output: array of the same string, every character times, with every letter in upper case

Rules:
- all letters are lowercase
- no other digits, except whitespace
- do not count the whitespace, for waving, but return all spaces in order that they were in original
- if empty string, return the empty array
- return strings only alphabet character times

E
"two words" == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]

D
Create a new empty array to hold new words.

A
- CREATE an array of strings
  - initialize the empty array
  - iterate over input string with index
    - each_with_index
- TRANSFORM strings to with one uppercase letter
  - by every iteration, uppercase the next letter
    - string[index] = char.upcase, mutate the string
  - next add this string to empty array
  - reassign the string to all downcased letters
- RETURN the array of modified strings
  - every uppercased word push to a new array
=end
require 'pry'
require 'pry-byebug'
# C
def wave(string)
  "the original string #{string.object_id}"
  new_array = []
  string.each_char.with_index do |char, index|
    if char != ' '
      string[index] = char.upcase
      new_array << string
      string = string.downcase
      "the reassigned string #{string.object_id}"
    end
  end
  new_array
end


p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# p wave("") == []
# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
# p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

# other solution from Codewars
def wave(str)
  result = []
  chars = str.downcase.chars
  chars.each_with_index do |char, idx|
    next if char == " "
    result << str[0...idx] + char.upcase + str[idx+1..-1]
  end
  result
end