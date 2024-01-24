# Description
# Write a method that takes a string as an argument and returns a new string in 
# which every uppercase letter is replaced by its lowercase version, 
# and every lowercase letter by its uppercase version. 
# All other characters should be unchanged.
# You may not use String#swapcase; write your own version of this method.

# P
Input: string with upper and lower case letters
Output: new string with switched upper and lower case
Explicit: take a string and switch cases of letters without using special methods.
If charcter is not an alphabetical letter, leave unchanged.
Implicit: 

# E
swapcase('PascalCase') == 'pASCALcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# D
Use string itself and create a new string to hold modified characters.
Create two arrays with lowercased letters and uppercased letters.

# A
1. create two constant arrays with lowercased letters and uppercased letters.
2. write a method with 1 argument.
3. create an empty string.
4. iterate over every character in string:
- if character is in lowercased array, change its case to upper case. Append modified character to string.
- if character is in uppercased array, chage its case to down case. Append modified character to string.
- else, append character without changes to new string.
5. return string

# C
UPPER = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
LOWER = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def swapcase(string)
  new_string = ''
  string.each_char do |char|
    if UPPER.include?(char)
      char = char.downcase
      new_string += char
    elsif LOWER.include?(char)
      char = char.upcase
      new_string += char
    else
      new_string << char
    end
  end
  new_string
end

swapcase('PascalCase') == 'pASCALcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'