# Integer reduction
=begin
In this Kata, you will be given two integers n and k and your task is to remove 
k-digits from n and return the lowest number possible, without changing the order 
of the digits in n. Return the result as a string.

Let's take an example of solve(123056,2). We need to remove 4 digits from 123056 
and return the lowest possible number. The best digits to remove are (1,2,3,6) 
so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: 
solve(1284569,2) = '12456', because we have removed 8 and 9.

P
Input: two integers
Output: string with digits

Rules:
- delete from first num, second digits num 
- do not change the order of the first num digits
- return the possible lowest num

E
1284569,2 -> remove 2 digits from first num, return the lowest possible num '12456'

D
string, array

A
- TRANSFORM the first num to array with substrings of this num by first_num - second num size
  - subtract second num from the first num size
  - find the smallest num and again in the right order
- SELECT the minimum num of them
- RETURN the string num
=end

# C
def solve(n, k)
  array_digits = n.to_s.chars
  sub_size = array_digits.size - k
  result = ''
  
  loop do
    if k == 0
      result << array_digits.join
      break
    end
    num_range = array_digits.slice(0...k)
    p [k, array_digits, num_range]
    result << num_range.min
    m = num_range.find_index(num_range.min)
    array_digits = array_digits.slice(m + 1..-1)
    k -= m
    # break if result.size == sub_size
  end

  result
end

# p solve(1284569, 2)
# 1284569 128 => 1
# 284569 284 => 2
# 84569 845 => 4
# 
p solve(5034853, 2)

# find the smallest one
# 1284569 here is 1, then the next smallest in the same order
# 123056 here is 0, the next smaller
# check if after the smallest one you have enough digits




