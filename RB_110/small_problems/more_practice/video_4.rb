=begin
P
Input: 2 strings
Output: boolean

Rules:
- find matching substrings in two strings
- return true if there is a matched substring and false otherwise
- strings can be in different cases

E
'1234567', '541265' --> matched sub is '12'

D
begin: string
middle: array, string
end: boolean

A
- FIND all substrings in first word
  - iterate over string and add all subs into array
- FIND all substrings in second word
  - iterate over string and add all subs into array
- FIND the same substring in the first and second array of subs
  - iterate over first array of subs
  - check every sub for including in second
- RETURN true if found, false otherwise
=end

# C
# def substring_test(str1, str2)
#   arr1 = []
#   max1 = str1.size
#   str1.size.times do |start|
#     2.upto(max1) do |length|
#       arr1 << str1[start, length].downcase
#     end

#     max1 -= 1
#   end

#   arr2 = []
#   max2 = str2.size
#   str2.size.times do |start|
#     2.upto(max2) do |length|
#       arr2 << str2[start, length].downcase
#     end

#     max2 -= 1
#   end

#   arr1.each do |sub|
#     if arr2.include?(sub)
#       return true
#     end
#   end

#   false
# end

# p substring_test('Something', 'fun')
# p substring_test('1234567', '541265')

=begin
P
Input: 2 strings
Output: boolean

Rules:
- check if str1 contains all letters from str2
- if yes, return true, false otherwise
- all letters are lowercase
- remember about two same chars

E
'rkqodlw', 'world' --> true

D
begin: strings
middle: array, string
end: boolean

A
- FIND all letters from str2 in str1
  - turn first into hash with chars and their count
  - turn second into hash
  - check if the letters and their counts in second and first are the same
- RETURN false if there is no some char or count is wrong
=end

# C
# def scramble(str1, str2)
#   str1_hsh = {}
#   str1.each_char do |el|
#     if str1_hsh.has_key?(el)
#       str1_hsh[el] += 1
#     else
#       str1_hsh[el] = 1
#     end
#   end

#   temp = ''
#   str2.each_char do |el|
#     if str1_hsh.has_key?(el) && str1_hsh[el] >= str2.count(el)
#       temp << el
#     end
#   end
#   temp.chars.sort == str2.chars.sort
# end

# p scramble('rkqodlw', 'world')
# p scramble('katas', 'steak')
# p scramble('javascript', 'scriptjava')
# p scramble('scriptingjava', 'javascript')