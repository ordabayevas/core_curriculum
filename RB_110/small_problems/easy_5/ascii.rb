# Description
# Write a method that determines and returns the ASCII string value 
# of a string that is passed in as an argument. The ASCII string value is 
# the sum of the ASCII values of every character in the string. 
# (You may use String#ord to determine the ASCII value of a character.)

# P
# Input: string
# Output: sum of all characters positions in ASCII table
# Explicit: 
#  - Write a method, which returns a string value (position in a table) of every character.
#  - Then sum all these integers and return the integer. Use String#ord to return a value of every character.
# Implicit: 
#  - Assume that the input is always string.
#  - Empty strings should return 0.
#  - Spaces also a string.

# E
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

# D
# use an empty array to hold the string values.

# A
#  - Take a string as an argument to a method.
#  - Create an empty array.
#  - Iterate through every character 
#  - Return the integer value with String#ord.
#  - Store all integers in empty array.
#  - Sum all integers in array an return the result.
#  - If string is empty return 0.

# C
def ascii_value(string)
  array_of_int = []
  if string.empty?
    0
  else
    string.each_char do |char|
      array_of_int << char.ord
    end
  array_of_int.reduce {|sum, int| sum + int}
  end
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further exploration
# char.ord.mystery == char

# char.ord.chr == char 
# The mystery method is the Integer#chr method, which returns a one character 
# String that represents an Integer's ASCII string value. 
# If you tried this with a String longer than 1 character, you would return false. 
# This is because String#ord only returns the ordinal value of the first character 
# of the calling String.

