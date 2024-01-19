# Description
# Write a method that takes a string argument and returns a new string 
# that contains the value of the original string with all consecutive duplicate 
# characters collapsed into a single character. You may not use String#squeeze or 
# String#squeeze!.

# P
# Input: string with duplicated characters
# Output: string with one character of duplicated consecutive characters
# Explicit: method that takes a string and deletes duplicates of consecutive characters and
# leaves only one. Do not use String#squeeze. Returns new string.

# E
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

# D
# Create a new empty string to store modified string.

# A
# - write a method that takes a string
# - create an empty string to hold modified string
# - iterate the input string by characters
#   - if current character is the same as the last one, skip it
#   - if not add to a new string
# - return new string

# C
# def crunch(string)
#   collapsed_str = ''
#   string.each_char do |char|
#     if char == collapsed_str[-1]
#       next
#     else
#       collapsed_str << char
#     end
#   end
#   collapsed_str
# end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

def crunch(text) # 'ddaaiillyy ddoouubbllee'
  index = 0
  crunch_text = ''
  while index == text.length# - 1 # index <= 23 - 1
    crunch_text << text[index] unless text[index] == text[index + 1] # 
    index += 1
  end
  crunch_text
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''