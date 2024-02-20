# Stop gninnipS My sdroW!
=begin
Write a function that takes in a string of one or more words, 
and returns the same string, but with all five or more letter words reversed 
(Just like the name of this Kata). Strings passed in will consist of only 
letters and spaces. Spaces will be included only when more than one word is present.
=end

# P
# Input: string of letters and spaces
# Output: the string with reversed letters in words with 5 letters

# E
# Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

# D
# Use an array to store words.

# A
# - method with 1 string
# - split words
# - iterate over words
# - if word is longer or equal to 5, reverse it
# - convert to string again

# C
def spinWords(string)
  arr = string.split(' ')
  arr2 = arr.map do |word|
    if word.size >= 5
      word.reverse
    else
      word
    end
  end

  arr2.join(' ')
end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test" 
p spinWords("This is another test") == "This is rehtona test"
p spinWords('test') == 'test'
