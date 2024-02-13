# Alphabet symmetry

=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b 
is in position 2. In the alphabet, a and b are also in positions 1 and 2. 
Notice also that d and e in abode occupy the positions they would occupy in the alphabet, 
which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy 
their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.
=end

# Input: array of strings in different cases without spaces
# Output: array with numbers

# - create a hash with alphabet letters as keys and their positions as values
# - write a method that takes 1 arg
# - loop through every element(string)
#   - loop through every character of string converted to array
#     - if character's index is equal to the same character's value in the alphabet hash:
#     - add += 1 to counter
#   - return the count value and change the value of a string to integer
# - return the array with integers

ALPHABET = {}
index = 1
array = ('a'..'z').to_a.each do |char| 
  ALPHABET[char] = index
  index += 1
end

def solve(array)
  array.map do |string|
    counter = 0
    string.downcase.chars.each_with_index do |char, index|
      if index + 1 == ALPHABET[char]
        counter += 1
      end
    end
    counter
  end
end

p solve(["abode","ABc","xyzD"]) #== [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
