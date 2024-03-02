# Counting Duplicates 
=begin
Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic 
characters and numeric digits that occur more than once in the input string. 
The input string can be assumed to contain only alphabets (both uppercase and lowercase) 
and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

P
Input: string of letters and digits
Output: num of letters that have duplicates in a string

Rules:
- find all letters that have duplicates
- return num of this letters
- ignore cases

E
"Indivisibilities" -> i has duplicates, s has duplicates -> return 2

D
use array to store letters, that have duplicates.

A
- FIND all letters that has count in a string more than 1
  - iterate over every letter
  - find count of every letter
- CREATE an array of letters that have duplicates
    - if more than 1, push to empty array
    - delete repeated chars
- RETURN num of these nums
  - return the size of array
=end

# C
def duplicate_count(string)
  downcased = string.downcase
  downcased.chars.select { |char| downcased.count(char) > 1 }.uniq.size
end


p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") #== 2
p duplicate_count("Indivisibilities") == 2
