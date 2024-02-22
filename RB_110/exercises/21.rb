# Count and Group Character Occurrences in a String
=begin
Write a method that takes a string as an argument and groups the number 
of times each character appears in the string as a hash sorted by the highest 
number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as 
lowercase ones.
=end

# P
# Input: string
# Output: hash with characters as values and their occurences as keys
# Explicit:
# - the final hash should group the characters by num of occurences
# - the case of chars should be ignored
# - also ignore spaces, special chars
# - sort hash by the highest number of occurrences

# E
# Create an empty hash.
# Create an array of alphabet.

# A
# - write a method that takes 1 string
# - convert string to array and remove duplicate characters, assign to a variable
# - iterate over array of characters:
#   - if char in alphabet, 
#     - count it's num in a string
#       - if this num is in a hash, add to it's value
#       - else, add num as a key, and the char as value in array
#   - else, go to the next char
# - return the hash

# C
ALPHABET = ('a'..'z').to_a + ('0'..'9').to_a

def get_char_count(string)
  # for creating a hash with keys and values
  unique_chars = string.downcase.chars.uniq
  hash = {}
  unique_chars.each do |char|
    if ALPHABET.include?(char)
      occurences = string.downcase.count(char)
      if hash.has_key?(occurences)
        hash[occurences] << char
      else
        hash[occurences] = [char]
      end
    else
      next
    end
  end
  # to sort the values inside keys
  new = {}
  hash.each do |k, v|
    new[k] = v.sort
  end
  # to sort the keys in descending order
  new.sort { |a, b| b <=> a }.to_h
end

p get_char_count("Mississippi") #== {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") #== {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") #== {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") #== {3=>["a", "b", "c"]}
p get_char_count("abc123") #== {1=>["1", "2", "3", "a", "b", "c"]}
