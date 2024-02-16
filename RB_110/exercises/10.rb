# Typoglycemia Generator

=begin
Background
There is a message that is circulating via public media that claims a reader 
can easily read a message where the inner letters of each words is scrambled, 
as long as the first and last letters remain the same and the word contains all 
the letters.
Another example shows that it is quite difficult to read the text where all 
the letters are reversed rather than scrambled.
In this kata we will make a generator that generates text in a similar pattern, 
but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are separated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia
=end

# P
# Input: string
# Output: the string with scrambled letters except first and last

# E

# D
# Use array to sort the letters.

# A
# - write a method that takes a string
# - separate by words
# - iterate each word
# - create an empty array
# - slice first and last letters and assign to two variables
# - iterate over chars and preserve the index of non-alphabetical char with it's value to a hash
# - alphabetical digits push to empty array
# - sort this array
# - add to this array the key and value from hash
# - return the array of modified words and join them

# C
ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a

def scramble_words(string)


  splitted_words = string.split(' ')

  modified_array = splitted_words.map do |word|
    temp_arr = []
    temp_hash = {}
    
    if word.size == 1
      word
    else
      word.chars.each_with_index do |char, i|
        if ALPHABET.include?(char)
          temp_arr << char
        else
          temp_hash[i] = char
        end
      end

      middle = temp_arr.slice(1..-2).sort
      new_array = middle.unshift(temp_arr[0]).push(temp_arr[-1])

      if !temp_hash.empty?
        temp_hash.each do |k, v|
          new_array.insert(k, v)
        end
      end

      new_array.join
    end
  end

  modified_array.join(' ')
end

# p scramble_words('professionals') #== 'paefilnoorsss'
# p scramble_words('i') #== 'i'
# p scramble_words('') #== ''
# p scramble_words('me') #== 'me'
# p scramble_words('you') #== 'you'
# p scramble_words('card-carrying') #== 'caac-dinrrryg'
# p scramble_words("shan't") #== "sahn't"
# p scramble_words('-dcba') #== '-dbca'
# p scramble_words('dcba.') #== 'dbca.'
# p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") 
# == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

p scramble_words("a dice atonement is zig-zag you're welcome dice callipygian lock-in.") == "a dcie aeemnnott is zag-izg yor'ue wcelmoe dcie caagiillpyn lcik-on."
