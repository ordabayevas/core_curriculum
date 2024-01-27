Write a method that takes a string, and returns a new string in which every 
consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, 
and whitespace should not be doubled.

# P
Input: string
Output: string with doubled consonants
Explicit: 
- take a string and return a new string where every consonant letter
(q,w,r,t,y,p,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m) is doubled.
- all other characters should not be doubled.

# E
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

# D
Create a string or array to store all consonant letters.
Create a new string to store modified string.

# A
- take a string
- convert to array
- iterate over array of characters:
  - if character is included to array of consonant letters,
  double them by multiplying.
  - if character is not in array, return character itself.
- return array with modified letters
- convert array to string

# C
CONSONANTS = %w(q w r t y p s d f g h j k l z x c v b n m)

def double_consonants(string)
  arr_of_chars = string.chars
  doubled = arr_of_chars.map do |char|
    if CONSONANTS.include?(char.downcase)
      char * 2
    else
      char
    end
  end
  p doubled.join
end

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
