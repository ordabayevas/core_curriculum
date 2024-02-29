# Where my anagrams at?
=begin
What is an anagram? Well, two words are anagrams of each other if they both 
contain the same letters. 
For example:

'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false

'abba' & 'abca' == false

Write a function that will find all the anagrams of a word from a list. 
You will be given two inputs a word and an array with words. 
You should return an array of all the anagrams or an empty array if there are none.
=end

=begin
P
Input: string, array with words
Output: array with anagrams

Rules:
- take a word
- find words from array, that have the same length and contain the same letters
- return them in array
- return empty if there are none

E
'racer', ['crazer', 'carer', 'racar', 'caers', 'racer']
'carer' -> 5 letters a, c, e, r, r
'racer' -> 5 letters a, c, e, r, r

D
Use an array.

A
- SELECT words from second array that are the same length as first input string
  - define the length of the first input
    - string#length
  - iterate over array of words
    - array#select
  - select only if length of iterated word is the same
    - string#length == word#length
  - remove all other shorter or longer words
    - #select returns nil for non-selected words
- TRANSFORM first input to array
  - convert first string to array of chars and preserve in variable
    - string#chars
- SORT first by characters
  - sort chars in order
    - chars#sort
- FIND the words from array that are contain the same letters as first input string
  - iterate over second input of selected words
    - arr#select
  - every word convert to array
    - word#chars
  - sort every word by chars
    - chars#sort
  - compare with the first input
    - first_input_arr == word_chars
- RETURN matched words in array
  - push to a new array all same words
    - arr#select from previous creates new arr
=end

# C
def anagrams(string, array)
  selected = array.select { |word| word.length == string.length }
  string_arr = string.chars.sort

  selected.select do |word|
    word.chars.sort == string_arr
  end
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) #== ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) #== ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) #== []
