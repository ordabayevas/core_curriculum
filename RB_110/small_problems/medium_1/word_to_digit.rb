# Write a method that takes a sentence string as input, and returns the same 
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# A
# - create a hash of words and their string digits
# - write a method that takes 1 argument string
# - string split by words
# - take array of words and iterate through every word
# - if word is in the hash of digit words, change to it's digit equivalent
# - return the modified array of words
# - convert to string with spaces

# C
def word_to_digit(sentence)
  # sentence.object_id
  string_nums = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  string_nums.each_with_index do |word, i|
    sentence.gsub!(/\b#{word}\b/, "#{i}")
  end
  sentence.object_id
end

word_to_digit('Please call me at Five five five one two three Four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'