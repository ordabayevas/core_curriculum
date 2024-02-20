# Most frequently used words in a text

=begin
Write a function that, given a string of text (possibly with punctuation and line-breaks), 
returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

Assumptions:
- A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. 
(No need to handle fancy punctuation.)
- Matches should be case-insensitive, and the words in the result should be lowercased.
- Ties may be broken arbitrarily.
- If a text contains fewer than three unique words, then either the top-2 or 
top-1 words should be returned, or an empty array if a text contains no words.
Examples:
top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]

top_3_words("  //wont won't won't")
# => ["won't", "wont"]
Bonus points (not really, but just for fun):
Avoid creating an array whose memory footprint is roughly as big as the input text.
Avoid sorting the entire array of unique words.
=end

# P
# Input: string of text
# Output: array with strings of the most often occurrences

# E
# p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
# p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
# p top_3_words("  //wont won't won't ") == ["won't", "wont"]
# p top_3_words("  , e   .. ") == ["e"]
# p top_3_words("  ...  ") == []
# p top_3_words("  '  ") == []
# p top_3_words("  '''  ") == []
# p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]

# D
# Use array to store words of string.
# Use hash to count the occurrences of words.

# A
# - write a method with 1 arg
# - iterate over every character in a string, and check whether or not this character in the array
# - if not in the array, return whitespaces
# - convert string to array with words, divide them by spaces
# - create an empty hash
# - if word is a key in a hash, add + 1 to its value
# - if not, create a key in a hash and assign to 1
# - sort hash by it's values and return the last 3 keys in array

require 'pry'
require 'pry-byebug'

# C
ALPHABET = ('a'..'z').to_a

def top_3_words(string)
  arr_with_spaces = []
  arr_string = string.downcase.chars
  arr_string.each_with_index do |char, i|
    # binding.pry
    if ALPHABET.include?(char) || char == ' '
      arr_with_spaces << char
    elsif char == "'" && (ALPHABET.include?(arr_string[i-1]) || ALPHABET.include?(arr_string[i+1]))
      arr_with_spaces << "'"
    else
      arr_with_spaces << ' '
    end
  end
  arr_of_words = arr_with_spaces.join.split(' ')
  
  hsh = {}
  arr_of_words.each do |word|
    if hsh.has_key?(word)
      hsh[word] += 1
    else
      hsh[word] = 1
    end
  end

  sorted = hsh.sort_by {|k, v| v }.reverse
  result = []
  sorted.each do |sub|
    if result.size >= 3
      break
    else
      result << sub[0]
    end
  end
  
  result
end

p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]