# Write a method that takes a string, and returns a new string in 
# which every character is doubled.

# P
Input: string
Output: string with every character is doubled
Expilicit:
- take a string and double every character
- return modified string
Implicit:
- the same string or new?
- what about spaces? return doubled spaces too
- if empty? return empty

# E
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

# D
Convert string to array.

# A
- write a method with 1 argument
- take a string and convert to array of characters
- iterate over every character
- double every character by multiplying by 2
- the return value save to a new array
- convert array of return values to string
- return string

# C
def repeater(string)
  arr_of_chars = string.chars
  doubled = arr_of_chars.map do |char|
    char * 2
  end
  doubled.join
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''