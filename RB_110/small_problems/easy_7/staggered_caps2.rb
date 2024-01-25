# Description
# Modify the method from the previous exercise so it ignores non-alphabetic 
# characters when determining whether it should uppercase or lowercase each letter. 
# The non-alphabetic characters should still be included in the return value; 
# they just don't count when toggling the desired case.

# P
# Input: String
# Output: new string with staggered case
# Explicit: 
# - take a string and return the new string with characters in different 
# cases one by one. 
# - Characters like spaces and digits should not be counted when determining cases, but still be there.
# Implicit: first letter always should be uppercase.

# E
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# D
Add another if else for non-alphabetical and alphabetical characters.
Create a string of alphabetical characters to determine if digit is a letter.

# A
1. check if string is a letter
- if true, check if index is even or odd and use a lower or upper case and increment index
- if false, go to next, do not increment index


def staggered_case(string)
  string_arr = string.chars
  index = 0
  modified = string_arr.each do |char|
    if char =~ /[a-z]/i
      if index.even?
        char.upcase!
      elsif index.odd?
        char.downcase!
      end
      index += 1
    else
      char
    end
  end
  modified.join
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'

# Further exploration

def staggered_case(string, count_digits)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if count_digits == 'no'
      if char =~ /[a-z]/i
        if need_upper
          result += char.upcase
        else
          result += char.downcase
        end
        need_upper = !need_upper
      else
        result += char
      end
    else
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    end
  end
  result
end

staggered_case('I Love Launch School!', 'yes') == 'I lOvE lAuNcH sChOoL!'