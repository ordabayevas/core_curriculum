# Anagram difference
=begin
Given two words, how many letters do you have to remove from them to make them anagrams?
Example
First word : c od e w ar s (4 letters removed)
Second word : ha c k er r a nk (6 letters removed)
Result : 10
Hints
A word is an anagram of another word if they have the same letters 
(usually in a different order).
Do not worry about case. All inputs will be lowercase.
=end

=begin
P 
Input: 2 strings
Output: number of removed letters to make them anagrams of each other

Rules:
- take 1 strings
- find letters that the same
- remove all other letters
- return the removed letters number
- if empty, return 0
- all letters case insensitive

E 
First word : codewars (cear)  (4 letters removed)
Second word : hackerrank (cera)  (6 letters removed)
Result : 10

D 
use a variable to count the removed letters.

A 
- FIND the letters that are common for the first and second string
  - define the shortest and the longest string
    - #sort_by their size
    - assign to variables
  - iterate the first string
    - #each_char
  - check if char is in the second too
    - #include?
- COUNT all same letters
  - if in the second is present
    - count = 0 initially
  - increment count
    - count += 1
- RETURN the total num of different letters from 1 and 2
  - subtract the total count from the first srtring length
    - res1 = str1.size - letters
  - same with the second
    - res2 = str2.size - letters
  - sum two nums and return
    - res1 + res2
=end

# C
# def anagram_difference(str1, str2)
#   sorted = [str1, str2].sort_by { |string| string.size }
#   shortest, longest = sorted
  
#   count = 0
#   shortest.each_char do |char|
#     if longest.include?(char)
#       count +=1
#     end
#   end

#   total = (str1.size - count) + (str2.size - count)
# end

require 'pry'
require 'pry-byebug'
# 2
def anagram_difference(str1, str2)
  hash1 = {}
  str1.each_char do |char|
    if hash1.has_key?(char)
      hash1[char] += 1
    else
      hash1[char] = 1
    end
  end
  
  hash2 = {}
  hash1.keys.each do |key|
    hash2[key] = str2.count(key)
  end

  same_letters_count = 0
  hash1.each do |k, v|
    count = [v, hash2[k]].min
    same_letters_count += count
  end

  total_different = (str1.size - same_letters_count) + (str2.size - same_letters_count)
end
# p anagram_difference('', '') == 0
# p anagram_difference('a', '') == 1
# p anagram_difference('', 'a') == 1
# p anagram_difference('ab', 'a') == 1
# p anagram_difference('ab', 'ba') == 0
# p anagram_difference('ab', 'cd') == 4
# p anagram_difference('aab', 'a') == 2
# p anagram_difference('a', 'aab') #== 2
# p anagram_difference('codewars', 'hackerrank') #== 10
p anagram_difference("eitznpksccidoozlhjaaoufdqlnwxdbsqvqlsrhsbxbmununkdycfxmzulkhjvf","tzgqphqirtilmoexketlxlgvimpjbrqhighcghpyqbxuhxydsaytlfhhspatzea")


# shorter solution Codewars
# def anagram_difference(string1, string2)
#   same_chars_count = 0
#   string1.chars.each do |char|
#     if string2.include?(char)
#       string2.sub!(char, '')
#       same_chars_count += 1
#     end
#   end
#   string2.size + (string1.size - same_chars_count)
# end
