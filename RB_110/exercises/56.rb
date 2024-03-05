# WeIrD StRiNg CaSe
=begin
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, 
and returns the same string with all even indexed characters in each word upper cased, 
and all odd indexed characters in each word lower cased. The indexing just explained 
is zero based, so the zero-ith index is even, therefore that character should be 
upper cased.

The passed in string will only consist of alphabetical characters and spaces(' '). 
Spaces will only be present if there are multiple words. Words will be separated by a 
single space(' ').

P
Input: string with letters and spaces
Output: modified the SAME string

Rules:
- modify and return the same string
- uppercase all even indexed letters
- downcase all odd indexed letters
- there are no multiple spaces between words
- do not count the spaces

E
"Weird string case" -> 'WeIrD StRiNg CaSe'

D
Use the same string.

A
- CREATE a variable to count the index of every word
  - initialize 0 and assign to a variable
  - 'clean' variable by every word
- TRANSFORM even index letters to uppercase, odds to downcase
  - iterate the string
  - if variable is even, then upcase character
  - if variable is odd, then downcase character
  - if space, assign variable to zero
- RETURN the same string
=end

# C
def weirdcase(string)
  word_index = 0
  string.each_char.with_index do |char, str_idx|
    if char != ' ' && word_index.even?
      string[str_idx] = char.upcase
      word_index += 1
    elsif char != ' ' && word_index.odd?
      string[str_idx] = char.downcase
      word_index += 1
    else
      word_index = 0
    end
  end
  string
end

p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"
