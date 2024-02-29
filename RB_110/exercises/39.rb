# Multiples of 3 or 5
=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5, 
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples 
of 3 or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once.

P
Input: integer
Output: integer, sum of multiples

Rules:
- find all multiples from 0 to given num
- exclude the given num
- if num is a multiple of 3 and 5 like 15, count it only once
- sum all multiples and return

E
20 -> 3, 5, 6, 9, 10, 12, 15, 18 => 78

D
Use array to store all multiples.

A
- CREATE an array with integers from 5 with step 5 till given number
  - iterate till given num
  - create a variable equal to 5
  - with every iteration add 5 to variable value
  - add every num to new arr
- CREATE an array with integers from 3 with step 3 till given number
  - the same with 3
- TRANSFORM two arrays in one with unique nums
  - add to arrays
  - remove duplicates
- RETURN the sum
  - sum the nums and return
=end

def solution(integer)
  five = 5
  five_arr = []
  while five < integer
    five_arr << five
    five += 5
  end
  
  three = 3
  three_arr = []
  while three < integer
    three_arr << three
    three += 3
  end
  
  (three_arr + five_arr).uniq.sum
end


p solution(10) #== 23
p solution(20) #== 78
p solution(200) #== 9168
