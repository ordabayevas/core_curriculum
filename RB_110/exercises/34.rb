# Highest Scoring Word
=begin
Given a string of words, you need to find the highest scoring word.
Each letter of a word scores points according to its position in the alphabet: 
a = 1, b = 2, c = 3 etc.
You need to return the highest scoring word as a string.
If two words score the same, return the word that appears earliest in the original string.
All letters will be lowercase and all inputs will be valid.

P
Input: string with words
Output: the word with the highest score

Rules:
- find all words in a string
- find the score of every word base on alphabet
- return the highest score word

E
'aaa b' -> first = 1 + 1 + 1 = 3 second = 2 -> return first word 'aaa'

D
Use arrays to hold words.
Use hash to create an alphabet.

A
- CREATE an alphabet hash
- TRANSFORM string to array with words
  - divide word by space
    - use #split(" ")
- FIND the score of every word
  - iterate over array of words
    - #each with word
  - iterate over every word's char
    - word#each_char with char
  - find the score of every char
    - return value of alphabet[char]
    - score += score
  - create a hash variable to hold a word and it's score
    - on #each_char level create a hash with word key and score as it's value
- RETURN the word with highest
  - return the key with the highest value
    - sort by values
=end

# C
ALPHABET = {}
('a'..'z').to_a.each_with_index do |l, i|
  ALPHABET[l] = i + 1
end

def high(string)
  arr_words = string.split(' ')
  hash = {}
  arr_words.each do |word|
    score = 0
    word.each_char do |char|
      char_score = ALPHABET[char]
      score += char_score
    end

    hash[word] = score
  end

  hash.sort_by { |k, v| -v }[0][0]
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
