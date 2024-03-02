# Duplicate Encoder
=begin
The goal of this exercise is to convert a string to a new string where each 
character in the new string is "(" if that character appears only once in the 
original string, or ")" if that character appears more than once in the original string. 
Ignore capitalization when determining if a character is a duplicate.

Examples
"din"      =>  "((("
"recede"   =>  "()()()"
"Success"  =>  ")())())"
"(( @"     =>  "))((" 

P
Input: string
Output: string characters replaced with brackets

Rules:
- convert every char even spaces and other digits into brackets
- if overall count in a string is more than 1, then ')'
- if count in a string is only 1, then ')'
- ignore cases

E
"recede"   =>  "()()()", count of 'r' is 1, 'e' is 3, 'c' is 1, 'e' is 3, 'd' is 1, 'e' is 1

D
New string to hold brackets.

A
- COUNT the total num of every char in a string
  - iterate over string
  - count every iterated char in a string
- RETURN '(' or ')' instead of char
  - if num of count is > 1, then ')'
  - if == 1, '('
- CREATE a new string with brackets
  - create a new variable string
  - push brackets to that string
  - return this variable
=end
require 'pry'
require 'pry-byebug'

# C
def duplicate_encode(string)
  new_string = ''
  string.downcase.each_char do |char|
    if string.downcase.count(char) == 1
      new_string << '('
    else
      new_string << ')'
    end
  end
  new_string
end


# p duplicate_encode("din") == "((("
# p duplicate_encode("recede") == "()()()"
# p duplicate_encode("Success") == ")())())"
# p duplicate_encode("(( @") == "))(("
p duplicate_encode('CodeWarrior') #"()(((())())"
p duplicate_encode(' @mk mz@bPyxRHFIc)ldPl GQy@wkF(wQmaRR') # "))))))()())()()((()()))())))))()))())"
