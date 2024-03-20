=begin
P
Input: string
Output: boolean
Rules:
- find if given string consist from substring which is repeated more than once
- substring is two and more letters
- all letters are lowercased
- subs are should be in the same order

E
'abaababaab' --> 'abaab' is repeated twice
'aba' --> false, because subs of this strings are 'ab', 'ba' and 
if we duplicate them, we will not have the initial string

D
begin: string
middle: array
end: boolean

A
- FIND all subs in string if string is even num, that are longer than 1 letter
  - write a method to find all subs with size 2 or more
  - add them all to empty array
- COMPOSE the initial string from each sub
  - iterate over every sub
  - if string size % sub size is equal to 0
    - multiply the sub by num of string.size / sub.size
- RETURN the boolean
  - check if initial string is equal to the result of sub
=end

require 'pry'
require 'pry-byebug'
def subs(string)
  subs = []

  (string.size - 1).times do |i|
    subs << string[0..i]
  end

  subs
end

def repeated_substring_pattern(string)
  all_subs_arr = subs(string)
  all_subs_arr.each do |sub|
    if string.size % sub.size == 0
      word_from_sub = sub * (string.size / sub.size)
      if word_from_sub == string
        #binding.pry
        return true
      end
    end
  end

  false

end

p repeated_substring_pattern('abaababaab')
p repeated_substring_pattern('aba')
p repeated_substring_pattern('abab')
p repeated_substring_pattern('aabaaba')
p repeated_substring_pattern('abcabcabc')
p repeated_substring_pattern('aaa')