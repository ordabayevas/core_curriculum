# Description
# Write a method that takes a single String argument and returns a new string 
# that contains the original value of the argument with the first character of 
# every word capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters.

# P
# Input: string
# Output: new string with capitalized words
# Explicit: 
# - capitalize every first letter of word in a string and return as a new string. 
# - all letters beside first letter of every word should be downcased.
# - word is a sequence of characters which is surrounded by blanks.
# Implicit:
# - if there only 1 char in word, capitalize it.
# - if word in quotes do not capitalize it.

# E
# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# D
# Split string to words and convert to array.
# Create new array to hold modified words.
# Convert array to string.

# A
# 1. write a method that takes 1 argument
# 2. split words and convert to array
# 3. iterate through every word and capitalize it.
# 4. every capitalized word save to the new array.
# 5. convert array to string and return.

# C
def word_cap(string)
  words = string.split(' ')
  cap_words = words.map do |word|
    word.capitalize
  end
  cap_words.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further exploration
# 1
def cap_words(string)
  words = string.split(' ')
  words.each do |word|
    word[0] = word[0].upcase
    word[1..-1] = word[1..-1].downcase
  end
  words.join(' ')
end

# 2
UPPER = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
LOWER = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def word_cap(string)
  words = string.split(' ')
  words.each do |word|
    if LOWER.include?(word[0])
      word.downcase!
      index = LOWER.find_index(word[0])
      word[0] = UPPER[index]
    else
      next
    end
  end
  words.join(' ')
end

word_cap('the javaScript language')

# def word_cap(str)
#   str.split.map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
# end


