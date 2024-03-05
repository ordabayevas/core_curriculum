# Decipher this!    
=begin
You are given a secret message you need to decipher. Here are the things you need to 
know to decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces

Examples

decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'
=end

=begin
P
Input: string with spaces, letters and digits
Output: modified string with letters and spaces

Rules:
- decipher every word in a string
- switch second and the last letters
- first num is an order num of letter

E
'82yade' --> switch y and e = 82eady --> return char in position 82 in table ascii = Ready

D
string

A
- TRANSFORM string to array of words
  - split by spaces
- TRANSFORM every word
  - iterate over every word in array
  - switch char on 2nd pos and char on the last
    - use simultaneous assignment
  - first letter replace by char by it's num
    - use method #chr
- RETURN all words in array
  - modify the current array
    - use #map
- TRANSFORM to string with spaces
  - join the array with space
=end

# C
def decipher_this(string_sent)
  arr_words = string_sent.split(' ')

  deciphered = arr_words.map do |word|
    first_letter = ''
    other_part = ''

    word.each_char do |char|
      if char.to_i.to_s == char
        first_letter << char
      else
        other_part << char
      end
    end
    
    if !other_part.empty?
      other_part[0], other_part[-1] = other_part[-1], other_part[0]
    end

    first_letter.to_i.chr + other_part
  end
  
  deciphered.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") #== "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") #== "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"
