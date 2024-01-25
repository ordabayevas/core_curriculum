# Description
# Write a method that takes a String as an argument, and returns a new String 
# that contains the original value using a staggered capitalization scheme 
# in which every other character is capitalized, and the remaining characters are lowercase. 
# Characters that are not letters should not be changed, but count as characters 
# when switching between upper and lowercase.

# P
# Input: String
# Output: new string with staggered case
# Explicit: 
# - take a string and return the new string with characters in different 
# cases one by one. 
# - All characters even spaces and digits should be counted, but leave them unchanged.
# Implicit: first letter always should be uppercase.

# E
# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# D
# Convert string to array.

# A
# 1. write a method with 1 argument
# 2. Convert string to array.
# 3. create a new variable 'index' which value is 0, to count every iteration instead of index.
# 3. iterate over every element of array.
#   - if index is even number, capitalize its value.
#   - if index is odd number, downcase its value.
#   - increment index by one.
# 4. convert array to string and return.

# C
def staggered_case(string)
  string_arr = string.chars
  index = 0
  modified = string_arr.each do |char|
    if index.even?
      char.upcase!
    elsif index.odd?
      char.downcase!
    end
    index += 1
  end
  modified.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Further exploration
def staggered_case(string, first_letter_case)
  result = ''
  need_upper = first_letter_case == 'upper' ? true : false
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!', 'lower') == "i lOvE LaUnCh sChOoL!"