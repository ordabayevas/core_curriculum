# Description
# Write a method that takes a string with one or more space separated words 
# and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# P
# Input: string with words and spaces
# Output: hash where keys are different sizes of words and values are the count of words
# Explicit: 
# - count the size of every word and return the value of count of words the same 
# size. 
# - Convert information in a hash. 
# - Word is a consecutive characters without spaces.
# Implicit:
# - If word is followed by digit without any spaces, digit counts like a part of word.
# - If input is an empty string, return the empty hash.


# E
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

# D
# - From description we will use a string input.
# - We can split words by spaces and turn to array, for determine the size of every word.
# - Use an empty array to store the sizes of words or transformate.
# - Create a hash where keys are sizes and count of these sizes are values.

# A
# We need to convert string to an array with words. Iterate every word and return the size
# of word and preserve it in array. Then take the array of integers and iterate every number again
# to know the count of every num in array. Make a duplicate of this array and store it in a 
# new variable. Delete duplicating numbers from new variables array. Iterate over unique numbers, 
# and use them as a key, to determine count of every key in original array of numbers.

# - write a method which takes a string
# - split string by spaces to make an array of words, assign to a new variable
# - iterate over array with words and return an array of sizes of every word
# - new array of words copy and preserve in a new variable
# - delete duplicated numbers from new variable
# - iterate over new variable and return the count of every iterated unique numbers count in
# original array of numbers
# - create a key of new hash from iterated number and write its count as a value

# C
def word_sizes(string)
  arr_words = string.split
  word_sizes = arr_words.map do |word|
    word.size
  end
  copy = word_sizes.dup
  unique_num = copy.uniq
  hash = {}
  unique_num.each do |num|
    value = word_sizes.count(num)
    hash[num] = value
  end
  hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Further Exploration
# Take some time to read about Hash::new to 
# learn about the different ways to initialize a hash with default values.