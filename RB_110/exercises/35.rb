# Replace With Alphabet Position
=begin
In this kata you are required to, given a string, replace every letter with 
its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it.
"a" = 1, "b" = 2, etc.

P
Input: string
Output: string numbers of positions in alphabet

Rules:
- return every character's position in alphabet as a string num
- if space or another digit, ignore
- if no letters in a string, return empty
- case insensitive

E
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

D
Use array to hold every char num.

A
- CREATE an alphabet hash
  - iterate over downcase letters and give them position nums as values
- TRANSFORM string into char num
  - iterate over every char
  - return the value of char key
  - if char is not in alphabet, skip it
- CREATE an array with numbers
  - create a new empty array
  - add all nums to that array
- RETURN the string from numbers
  - convert nums to string with space
=end

# C
ALPHABET = {}
('a'..'z').to_a.each_with_index do |l, i|
  ALPHABET[l] = i + 1
end

def alphabet_position(string)
  new = []
  string.downcase.each_char do |char|
    if ALPHABET.include?(char)
      new << ALPHABET[char]
    end
  end

  new.join(' ')
end


p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
