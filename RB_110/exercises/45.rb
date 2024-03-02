# Transform To Prime
=begin
Task :
Given a List [] of n integers, find the minimum number to be inserted in a list, 
so that the sum of all elements of the list should equal the closest prime number .

Notes
List size is at least 2.
List's numbers will only have positives (n > 0).
Repetition of numbers in the list could occur.
The newer list's sum should equal the closest prime number.

Input >> Output Examples
1- minimumNumber ({3,1,2}) ==> return (1)
Explanation:
Since, the sum of the list's elements equal to (6), the minimum number to be 
inserted to transform the sum to prime number is (1), 
which will make *the sum of the List** equal the closest prime number (7)*.
2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32), the minimum number to be 
inserted to transform the sum to prime number is (5), 
which will make *the sum of the List** equal the closest prime number (37)*.
3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since, the sum of the list's elements equal to (189), the minimum number to be 
inserted to transform the sum to prime number is (2), which will make *the sum 
of the List** equal the closest prime number (191)*.
=end

=begin
P
Input: array of integers
Output: integer

Rules:
- find the closest prime num to sum of all nums in array
- return the difference between sum and prime num

E
[2,12,8,4,6] -> 32 is the sum, increment by 1, till prime num

D
Use given array and integers

A
- FIND a sum of num of given arr
  - create sum variable and assign to 0
  - iterate and add all nums to sum, every time reassign the sum
- FIND the next prime num
  - increment the sum by 1
  - check if it is a prime num or not
    - find the square root
    - find prime nums < than square root
    - divide num by these prime nums
    - if it is divisible by one of them, it is not a prime
    - if not it is a prime
- RETURN the difference between prime num and sum
  - subtract sum from the prime num
=end
require 'pry'
require 'pry-byebug'

# C
def is_prime?(next_num)
  root = Math.sqrt(next_num)
  nums = (2..root).to_a
  less_than_root = nums.select { |num| num < root }

  less_than_root.each do |num|
    if next_num % num == 0
      return false
    end
  end
  true
end


def minimum_number(arr_nums)
  sum_of_arr = 0
  arr_nums.each { |num| sum_of_arr += num }
  next_num = sum_of_arr
  
  loop do
    break if is_prime?(next_num)
    next_num += 1
  end

  next_num - sum_of_arr
end

p minimum_number([3,1,2]) #== 1
p minimum_number([5,2]) #== 0
p minimum_number([1,1,1]) #== 0
p minimum_number([2,12,8,4,6]) #== 5
p minimum_number([50,39,49,6,17,28]) #== 2
