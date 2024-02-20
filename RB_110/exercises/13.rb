# Detect Pangram
=begin
A pangram is a sentence that contains every single letter of the alphabet at least once. 
For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, 
because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, 
False if not. Ignore numbers and punctuation.
=end

# P
# Input: string
# Output: boolean
# Explicit:

# A
# - write a method with 1 arg
# - take the string and iterate over every char
#   - if char is in alphabet array delete this char from alphabet
#   - else go to the next char
# - if after iteration alphabet array is empty, then return true
# - else, false

# C
def panagram?(string)
  alphabet = ('a'..'z').to_a
  string.downcase.each_char do |char|
    if alphabet.include?(char)
      alphabet.delete(char)
    else
      next
    end
  end
  
  alphabet.empty? ? true : false
end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false
