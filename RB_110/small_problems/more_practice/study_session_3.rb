=begin
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

P 
Input: array of string words
Output: array of integers 

Rules: 
- find in every word, letters that are on their same positions as in alphabet 
- return number of letters that occupy the same position in a word
- words can contain letters in different cases, ignore cases
- words do not have spaces and other digits

E 
["abode","ABc","xyzD"] -> a, b, d, e = 4, a,b, c = 3, d = 1
"abide","ABc","xyz"] -> a, b, d, e = 4, 3, 0

D 
start: string input in array 
middle: array to iterate words, and strings to iterate chars, alphabet hash
end: array of integers 

A 
- INITIALIZE the alphabet hash
  - create an array of alphabetical letters in lowercase
- ACCESS every word
  - iterate string Array with map transform every word to integer
- ACCESS every character to find out their indices
  - create a variable counter to count characters that are have right position
  - iterare every word by chars 
  - check the index of every char, find key in a hash with this char and check it's value, if they are equal select this char
- RETURN the num of elements that are equal by index
  - return the counter's value
=end 

def symm(arr_strings)
  alphabet = ('a'..'z')
  alpha_hash = {}
  alphabet.each_with_index { |char, index| alpha_hash[char] = index + 1 }

  arr_strings.map do |word|
    qualifying_chars = word.downcase.count do |char, index|
      alpha_hash[char] == index + 1
    end
    qualifying_chars.length
  end

end

p symm(["abode","ABc","xyzD"]) == [4, 3, 1]
p symm(["abide","ABc","xyz"]) == [4, 3, 0]
p symm(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
p symm(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]