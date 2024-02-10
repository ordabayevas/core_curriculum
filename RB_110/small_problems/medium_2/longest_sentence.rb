# Write a program that reads the content of a text file and 
# then prints the longest sentence in the file based on number of words. 
# Sentences may end with periods (.), exclamation points (!), or question marks (?). 
# Any sequence of characters that are not spaces or sentence-ending characters 
# should be treated as a word. You should also print the number of words in the 
# longest sentence.

# P
# Input: string text
# Output: longest sentence and the number of words
# Explicit:
# - take a text and find the longest sentence in it 
# - sentence is a consequence of word which is ends with characters '.', '!', '?'
# - word is a consequence of characters without blanks.
# - '--' counts as a word

# E
# 'It is rather for us to be here dedicated to the great task 
# remaining before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.'
# 86 words

# D
# Divide the text by sentences and store into arrays.

# A
# - write a method that takes 1 arg - text
# - split the text by ., !, ?
# - store every sentence into array
# - define the length
require 'pry'
require 'pry-byebug'

# def longest_sentence(text)
#   words = text.split
#   new = []
#   temp = []
#   words.each do |word|
#     # binding.pry
#     temp << word
#     if word.include?('.') || word.include?('!') || word.include?('?')
#       new << temp
#       temp = []
#     end
#   end
#   #binding.pry

#   longest = new.sort_by { |sentence| sentence.size }[-1]
#   puts longest.join(' ')
#   puts "#{longest.size} words"

#   # new
# end

# text = File.read('frankestein.txt') #??

# longest_sentence(text)

