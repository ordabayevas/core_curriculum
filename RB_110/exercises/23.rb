# Scramblies
=begin
Complete the function scramble(str1, str2) that returns true if a portion 
of str1 characters can be rearranged to match str2, otherwise returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.
=end

# P
# Input: two strings
# Output: boolean

# Explicit:
# - take two strings
# - if string1 contains all letters from string2, even in different order, return true
# - omit extra letters
# - if not, return false

# E
# 'cedewaraaossoqqyt', 'codewars' => 'c', 'e', 'd', 'w', 'a', 'r', 's', 'o'

# D
# Use existed data.

# A
# - write a method with 2 args
# - create an array with 2nd string chars
# - iterate over 2nd string
#   - if 1st string contains the current iterated char
#     - delete this char from array
#   - else
#     - go to the next char
# - if after iteration, array is empty, return true
# - else return false
require 'pry'
require 'pry-byebug'

# C
# 1st didn't pass because of the 'delete' method

# def scramble(string1, string2)
#   arr = string2.chars
#   string2.each_char do |char|
#     binding.pry
#     if string1.include?(char)
#       if arr.include?(char)
#         arr.delete(char)
#       else
#         return false
#       end
#     else
#       next
#     end
#   end

#   arr.empty? ? true : false
# end

# 2nd didn't pass because string 2 cannot be as a whole in a string 1 in some cases

# def scramble(string1, string2)
#   first = string1.chars.sort.join
#   second = string2.chars.sort.join
#   if first.slice(second) != nil
#     true
#   else
#     false
#   end
# end

# 3rd right model
def scramble(string1, string2)
  arr = string2.chars.uniq
  arr.each do |char|
    if string1.count(char) >= string2.count(char)
      string2.delete!(char)
    else
      return false
    end
  end

  string2.empty? ? true : false
end

p scramble('scriptjavx', 'javascript') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

