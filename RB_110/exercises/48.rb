# Sum of Digits / Digital Root
=begin
In this kata, you must create a digital root function.
A digital root is the recursive sum of all the digits in a number. 
Given n, take the sum of the digits of n. If that value has more than one digit, 
continue reducing in this way until a single-digit number is produced. 
This is only applicable to the natural numbers.

Here's how it works:

digital_root(16)
=> 1 + 6
=> 7

digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6

digital_root(132189)
=> 1 + 3 + 2 + 1 + 8 + 9
=> 24 ...
=> 2 + 4
=> 6

digital_root(493193)
=> 4 + 9 + 3 + 1 + 9 + 3
=> 29 ...
=> 2 + 9
=> 11 ...
=> 1 + 1
=> 2

P
Input: integer
Output: sum of all digits till 1 num

Rules:
- create a recursive code
- sum all digits in a num
- continue to sum while num has more than 1 digit

E
digital_root(456)
4 + 5 + 6 = 15 -> 1 + 5 = 6
return 6

D
Use integers.

A
- TRANSFORM num to string
  - convert num to strings in array
- FIND the sum of all digits
  - create a variable sum
  - add every num, converted to integer to sum
- REPEAT till 1 digit
  - if sum is more than 1 digit
  - find sum again
- RETURN the 1 digit
  - if sum 1 digit
  - return as integer
=end

# C
def digital_root(integer)
  digits = integer.to_s.chars
  sum = 0
  digits.each { |digit| sum += digit.to_i }
  
  if sum.to_s.size > 1
    sum = digital_root(sum)
  end

  sum
end

# p digital_root(16)
# p digital_root(456)
p digital_root(493193)
p digital_root(132189)
p digital_root(942)
