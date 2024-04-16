=begin
Given a string and an integer i, write a method that splits the string 
up into a sentence of strings, where each string in the sentence contains 
a character of the argued string and every ith character after it:

P
Input: string and integer
Output: string sentence

Rules:
- take a string and integer and return the string sentence
- words in sentence should start from the first char in an input string
- then add every integer-ordered number to this letter to build the first word
- the second word will consist the character number two and other letters that are integer-ordered from this char
- continue till the last character
- do not count the spaces as characters
- if input string is empty return empty
- if integer is less than 1, return "i cannot be less than 1"

E
"mary had a little lamb", 3 --> mydila ...
"abcde", 100 --> a b c d e

D
begin: string
middle: array to contain words
end: string sentence

A
- RETURN "i cannot be less than 1", if input integer is less than 1
- CREATE an array of characters without spaces
  - iterate over array of chars, and remove spaces
- CREATE words for result string, characters size times
  - create a variable word and assign to current character
  - add current char to variable word 
  - iterate over array indices starting from the current index and count every integer char in array and add to word
  - return this word to array
- RETURN the array of words with spaces
  - use method #join with space
=end

# C 
def fragment(string, integer)
  return "i cannot be less than 1" if integer < 1

  arr = string.chars
  arr.delete(' ')
  
  words = []
  arr.size.times do |start|
    word = arr[start]

    loop do
      start += integer
      break if start >= arr.size
      word << arr[start]
    end

    words << word
  end

  words.join(' ')
end

p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("abcde", 100) == "a b c d e"
p fragment("", 1) == ""

=begin
edward's code
def fragment(string, i)
  return "i cannot be less than 1" if i < 1
  return "" if string.length == 0

  chars = string.delete(" ").chars
  current_string = ""
  return_strings = []

  chars.each_with_index do |char, char_index|
    current_string << char
    increment_multiple = 1
    character_to_add = chars[char_index + (increment_multiple * i)]
    while character_to_add != nil
      current_string << character_to_add
      increment_multiple += 1
      character_to_add = chars[char_index + (increment_multiple * i)]
    end
    return_strings << current_string
    current_string = ""
  end
  
  return_strings.join(" ")
end
=end