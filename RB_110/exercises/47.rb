# Alphabetized
=begin
Re-order the characters of a string, so that they are concatenated into 
a new string in "case-insensitively-alphabetical-order-of-appearance" order. 
Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the 
english alphabet letters.

Example:
alphabetized("The Holy Bible") # "BbeehHilloTy"

P
Input: string
Output: sorted by alphabet string

Rules:
- take a string and delete all whitespaces
- re-order the strings characters in alphabet order
- ignore cases

E
"A b B a" -> delete spaces 'AbBa', sort by alphabet

D
Use array to sort.

A
- TRANSFORM string to array without spaces
  - delete spaces
  - convert to array
- SORT by alphabet
  - sort elements with downcase
- RETURN array converted to string
  - join array elements
=end

# C
# def alphabetized(string)
#   string_arr = string.delete(' ').chars
#   string_arr.sort_by(&:downcase).join
# end

# def alphabetized(string)
#   string.delete!(' ')
#   hash = {}
#   string.each_char do |char|
#     hash[char] = char.downcase
#   end
  
#   hash.sort_by { |k, v| v }.to_h.keys
# end

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

def alphabetized(string)
  new_string = ''
  string.each_char do |char|
    if ALPHABET.include?(char)
      new_string << char
    end
  end

  d = new_string.size.to_s.size
  arr = new_string.chars.each_with_index do |char, idx|
    char << (sprintf "%0#{d}d", idx)
  end
  
  sorted = arr.sort_by(&:downcase)
  last = sorted.map { |char| char[0]}
  last.join
end

# def alphabetized(string)
#   string.delete!(' ')
#   hash = {}
#   string.chars.each_with_index do |char, idx|
#     char << idx.to_s
#     hash[char] = char.downcase.ord
#   end
  
#   hash.each_with_object([]) do |(k, v), array|
    
#       end        
#     end
#   end

#   #hash

# end
# p alphabetized("") == ""
# p alphabetized(" ") == ""
# p alphabetized(" a") == "a"
# p alphabetized("a ") == "a"
# p alphabetized(" a ") == "a"
# p alphabetized("A b B a") #== "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized('!@$%^&*()_+=-`')