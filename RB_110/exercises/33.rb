# Anagram Detection
=begin
An anagram is the result of rearranging the letters of a word to produce a new word 
(see wikipedia).
Note: anagrams are case insensitive
Complete the function to return true if the two arguments given are anagrams 
of each other; return false otherwise.

Examples
"foefet" is an anagram of "toffee"

"Buckethead" is an anagram of "DeathCubeK"
=end

=begin
P 
Input: 2 strings
Output: boolean -> true if anagrams, false if Not

Rules:
- take two case insensitive words
- compare their length and if they contain the same letters
- if yes, true
- if not, false

E
"dumble", "bumble" -> no 'd' in the second word, return false

D 
Use array to convert words to characters and sort.

A 
- TRANSFORM strings to arrays
  - convert to array of downcased str1
    - str1#chars
  - convert to array of downcased str2
    - str2#chars
- SORT both arrays
  - order letters in the same way
    - use #sort
- RETURN true if they are equal, false otherwise
  - compare two arrays
    - with #==
=end

# C
def is_anagram(str1, str2)
  arr1 = str1.downcase.chars.sort
  arr2 = str2.downcase.chars.sort

  arr1 == arr2 ? true : false
end

p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false
