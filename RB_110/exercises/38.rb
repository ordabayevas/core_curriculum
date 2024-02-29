# Delete a Digit
=begin
Task
Given an integer n, find the maximal number you can obtain by deleting exactly 
one digit of the given number.

Example
For n = 152, the output should be 52;
For n = 1001, the output should be 101.

Input/Output
[input] integer n
Constraints: 10 ≤ n ≤ 1000000.
[output] an integer

P
Input: integer
Output: integer with deleted digit

Rules:
- delete one digit from original
- check all options and choose the max
- the integer is in a range 10 ≤ n ≤ 1000000

E
1001 -> 100, 101, 101, 001 => 101
152 -> 15, 12, 52 => 52

D
Use string to delete a digit.

A
- TRANSFORM integer input to string
  - convert input to string
- CREATE an array of all nums
  - create an empty array
  - delete one digit every time
  - push all digits to array and convert them
- FIND the largest num
  - find the max
=end

# C
def delete_digit(integer)
  string = integer.to_s
  arr = []
  string.each_char.with_index do |char, idx|
    new = string[0...idx] + string[idx+1..-1]
    arr << new.to_i
  end
  arr.max
end

# def delete_digit(integer)
#   string = integer.to_s
#   arr = []
#   string.each_char.with_index do |char, idx|
#     string.delete!(char)
#     arr << string.to_i
#     string = integer.to_s
#   end
#   arr.max
# end
    
p delete_digit(152) #== 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
