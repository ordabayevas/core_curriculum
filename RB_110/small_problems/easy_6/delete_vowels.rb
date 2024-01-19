# Description
# Write a method that takes an array of strings, and returns an array 
# of the same string values, except with the vowels (a, e, i, o, u) removed.

# P
# Input: array of strings
# Output: array of strings without vowels
# Explicit: take an array of strings and delete all vowels and return.
# Implicit: the same array or new?

# E
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# D
# Create an array that holds all upper and lower cased vowel letters.
# Convert string to array with words.

# A
# 1. Create a constant with vowels.
# 2. Write a method that takes an array of strings
# 3. Iterate over array and modify every word
# 5. Iterate over every letter in a word
# 6. Check if letter is in the vowels array
#   - if true, delete
#   - if false, return the same letter
# 7. Return the result of main iteration, it would be an array of words
# 8. Convert array to string

# C
VOWELS = 'AIEOUaieou'

def remove_vowels(arr_of_str)
  arr_of_str.map do |word|
    word.each_char do |letter|
      if VOWELS.include?(letter)
        word.delete!(letter)
      else
        letter
      end
    end
  end
  arr_of_str
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# def remove_vowels(strings)
#   strings.map { |string| string.delete('aeiouAEIOU') }
# end