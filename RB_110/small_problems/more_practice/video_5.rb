=begin
P
Input: string
Output: integer, size of the longest palindrome

Rules: 
- find palindromes and return the size of the longest
- if empty string, return 0
- if no palindromes, return 1

E
'baabcd' --> 4
'a' --> 1
'' --> 0

D
begin: string
middle: string
end: integer

A
- FIND all substrings of string
- FIND palindromes in substrings
- RETURN the size of the longest
=end

# C
def longest_palindrome(string)
  return 0 if string.empty?
  
  subs = []
  max_range = string.size
  string.size.times do |start|
    1.upto(max_range) do |length|
      subs << string[start, length]
    end

    max_range -= 1
  end

  subs.select { |sub| sub == sub.reverse }.map { |sub| sub.size }.max
end

p longest_palindrome('baabcd')
p longest_palindrome('a')
p longest_palindrome('abcde')
p longest_palindrome('')