# Kebabize
=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:

the returned string should only contain lowercase letters
=end

# P
# Input: string in camel case
# Output: string in kebab case
# Explicit:
# - write a method that takes 1 string
# - change the cases of every letter to downcase
# - divide the words by dash line
# - every word except first starts from uppercase letter

# Implicit:
# - if there is a digit num, remove it
# - if word have all uppercase letters, consider all of them like every word
# - should be the same string or new?

# E
# p kebabize('myCamelCasedString') == 'my-camel-cased-string'
# p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
# p kebabize("CAMEL" == "c-a-m-e-l")

# D
# Use an array to split words and store them.

# A
# - method takes a 1 string
# - divide the string by words: every word starts from uppercase letter
# - iterate over words array
# - downcase all words
# - insert dash line after every word, except last word
# - convert array to string

# require 'pry'
# require 'pry-byebug'

# C
def kebabize(string)
  array_of_chars = string.chars.select { |char| char.to_i == 0}
  downcase_letters_counter = 0
  array_of_words = []

  array_of_chars.each_with_index do |char, i|
    if (array_of_chars[i + 1] == nil)
      word = array_of_chars.slice((i - downcase_letters_counter)..i)
      array_of_words << word
    elsif (array_of_chars[i + 1].downcase == array_of_chars[i + 1])
      downcase_letters_counter += 1
      next
    else
      word = array_of_chars.slice((i - downcase_letters_counter)..i)
      array_of_words << word
      downcase_letters_counter = 0
    end
  end

  last_arr = array_of_words.map do |subarray|
    subarray.join.downcase
  end

  last_arr.join('-')
end

p kebabize('myCamelCasedString') #== 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') #== 'my-camel-has-humps'
p kebabize("CAMEL") #== "c-a-m-e-l"

# Codewars
# def kebabize(str)
#   a = str.gsub(/([0-9])/, '')
#   b = a.split(/(?=[A-Z])/)
#   c = b.join('-').downcase
# end
