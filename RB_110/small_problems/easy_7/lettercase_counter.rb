# Description
# Write a method that takes a string, and then returns a hash that contains 3 entries: 
# one represents the number of characters in the string that are lowercase letters, 
# one represents the number of characters that are uppercase letters, 
# and one represents the number of characters that are neither.

# P
# Input: string
# Output: hash with 3 key-value pairs
# Explicit: take one string and sort by lowercase, uppercase and digits.
# Create a hash with 3 key- value pairs where keys are: lowercase, uppercase, neither 
# and values are numbers of every type of letters.

# E
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# D
# Create strings with alphabetic uppercased letters, lowercased  letters.
# Create 3 arrays to hold 3 types of characters.
# Create a Hash to store modified data.

# A
# 1. create a constant and assign it to a string with uppercased letters
# 2. create a constant and assign it to a string with lowercased letters
# 2. write a method that takes a string as an argument
# 3. lowercase = []
# 4. uppercase = []
# 5. neither = []
# 6. iterate over every character in string
#   - if character is included in uppercased constant, then push it to uppercase array
#   - if character is included to lowercsed constant, then push to lowercased
#   - if else push to neither
# 7. create a new hash
# 8. create 3 entries

# C
UPPER = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
LOWER = UPPER.downcase

def letter_case_count(string)
  lowercase = []
  uppercase = []
  neither = []
  string.each_char do |char|
    if UPPER.include?(char)
      uppercase << char
    elsif LOWER.include?(char)
      lowercase << char
    else
      neither << char
    end
  end
  case_count = {lowercase: lowercase.size, uppercase: uppercase.size, neither: neither.size}
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }