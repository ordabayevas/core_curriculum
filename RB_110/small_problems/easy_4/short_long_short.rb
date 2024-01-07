# Description:
# Write a method that takes two strings as arguments, 
# determines the longest of the two strings, 
# and then returns the result of concatenating the shorter string, 
# the longer string, and the shorter string once again. 
# You may assume that the strings are of different lengths.

# P
# Input: two strings
# Output: one string
# Explicit requirements: writing a method which is 
#   a) takes two arguments of two different length;
#   b) compares and determines the length of two string arguments;
#   c) the return value is a string with construction "shortest + longest + shortest".
# Implicit requirements:
#   Returns a new string.
#   Assume that always given two strings of different length.

# E
# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

# D
# The input and output always string objects.

# A
# Define a method called "short_long_short()" with two parameters "string1", "string2".
# Define the string1 and string2 length.
# Compare with "if, else" statement and initialize two variables longest and shortest.
# If string1 is longer then assign it to variable the 'longest', and string2 to the 'shortest'.
# Otherwise, string1 to the 'shortest', string2 to the 'longest'
# Use a concatenation method and build a new string with syntax "shortest + longest + shortest".
# Return the new string.

# C
def short_long_short(string1, string2)
  if string1.length > string2.length
    longest = string1
    shortest = string2
  else
    longest = string2
    shortest = string1
  end
  shortest + longest + shortest
end
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
