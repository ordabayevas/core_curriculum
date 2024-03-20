# Reverse or rotate?
=begin
The input is a string of digits. Cut the string into chunks 
(a chunk here is a substring of the initial string) of size sz 
(ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits 
is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. 
Put together these modified chunks and return the result as a string.

If:
sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".

Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> "" 
revrot("563000655734469485", 4) --> "0365065073456944"

P
Input: string of digits and integer
Output: reversed or rotated string

Rules:
- take two input
- divide string by parts that given by second input
- do not consider the last part if it is size less than second input
- every part reverse if sum of it's digits cubes is divisible by two without remainder
- if not divisible, rotate the string to one digit to the left
- if empty string, return empty string
- if second input is bigger than size of string, return empty string
- if second input is less or equal to 0, return empty string

E
"123456987654", 6 --> 
'123456' = 441  --> '234561'
'987654' = 1989 --> '876549'
'234561' + '876549' = '234561876549'

D
string, array

A
- TRANSFORM the string into substrings
  - iterate over string
  - slice the string by input integer
  - add every part to array
  - if last is smaller than the second input, do not add
- FIND the sum of cubes of every part
  - iterate over every part
  - iterate over every digit in part
  - calculate every digit's cube and find the sum of every part
- ROTATE the part if sum is not divisible by 2
    - if not divisible by 2, add the first digit to the end
- REVERSE the part if sum is divisible by 2
    - if sum is divisible by 2, reverse the substring
- RETURN all modified parts as one string
    - join the substrings
=end

# C
def revrot(string, chunk_size)
  if (chunk_size > string.size) || (string.empty?) || (chunk_size == 0)
    return ""
  end

  start_char = 0
  substrings = []
  loop do
    substrings << string.slice(start_char, chunk_size)
    start_char += chunk_size
    break if substrings.size == (string.size / chunk_size)
  end
  
  substrings.each do |sub|
    sub_sum = 0
    sub.each_char do |digit|
      sub_sum += digit.to_i ** 3
    end

    if sub_sum % 2 == 0
      sub.reverse!
    else
      sub << sub.slice!(0, 1)
    end
  end
  
  substrings.join
end


p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"
