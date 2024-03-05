# Playing with digits
=begin
Some numbers have funny properties. For example:

89 --> 8¹ + 9² = 89 * 1

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits) 
and a positive integer p

we want to find a positive integer k, if it exists, such as the sum of the digits 
of n taken to the successive powers of p is equal to k * n.
In other words:

Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

If it is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.

dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

P
Input: main positive integer n and positive integer p
Output: integer num k

Rules:
- expand the given num n to digits
- start to power first digit to second given input p
- all other digits will be in power p + 1, p + 2 and so on
- sum all powered digits
- divide this sum by the first given input n
- return the num k
- if sum cannot be divided by first given input n, return -1

E
92, 1 --> 92 is n, 1 is p
9**1, 2**2 --> expand the num and power by p
9 + 4 --> sum the digits
13 / 92 = 0 --> divide by initial num
return -1, since the result is 0

D
Use an array.

A
- TRANSFORM integer n to digits
  - convert to string
  - convert to array
- FIND the power of every num by p is incrementing by 1 by every digit
  - iterate over array
  - every element convert to integer
  - power to p + index
  - preserve in array
- FIND the sum of these nums
  - sum all nums
- FIND the num k
  - divide sum by initial 1st num
  - return if num is positive
- RETURN k or -1
  - if num is 0, return -1
=end

# C
def dig_pow(n, p)
  digits = n.to_s.chars
  arr_of_digits = []
  digits.each_with_index do |digit, idx|
    powered = (digit.to_i) ** (p + idx)
    arr_of_digits << powered
  end

  (arr_of_digits.sum) % n == 0 ?  (arr_of_digits.sum / n) : (-1)
end

p dig_pow(89, 1) #== 1
p dig_pow(92, 1) #== -1
p dig_pow(46288, 3) #== 51
p dig_pow(695, 2) #== 2
p dig_pow(46288, 5)

