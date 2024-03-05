# Equal Sides Of An Array
=begin
You are going to be given an array of integers. Your job is to take that array and 
find an index N where the sum of the integers to the left of N is equal to the sum of 
the integers to the right of N. If there is no index that would make this happen, 
return -1.

For example:

Let's say you are given the array {1,2,3,4,3,2,1}: Your function will return the index 3, 
because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) 
and the sum of the right side of the index ({3,2,1}) both equal 6.

Let's look at another one.
You are given the array {1,100,50,-51,1,1}: Your function will return the index 1, 
because at the 1st position of the array, the sum of left side of the index ({1}) and 
the sum of the right side of the index ({50,-51,1,1}) both equal 1.

Last one:
You are given the array {20,10,-80,10,10,15,35}
At index 0 the left side is {}
The right side is {10,-80,10,10,15,35}
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

Note: Please remember that in most programming/scripting languages the index of an 
array starts at 0.

Input:
An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.

Output:
The lowest index N where the side to the left of N is equal to the side to the right of N. 
If you do not find an index that fits these rules, then you will return -1.

Note:
If you are given an array with multiple answers, return the lowest correct index.
=end

=begin
P
Input: array of integers, pos and neg
Output: lowest index of the num, where both sides sums are equal

Rules:
- go by every element starting from 0 index
- find the sum of integers of left and right sides integers from every element
- return the index of the first element, where both sides sums are equal

E
[10,-80,10,10,15,35,20]
10 --> left side 0 and right 10, go to next
-80 --> left side is 10, next
10 --> -70 from the left, next
10 --> -60 from the left, next
15 --> -50 from the left, next
35 --> -35 from the left, next
20 --> 0 from the left, 0 from the right
return 6

D
Use arrays to find the sum.

A
- FIND a sum from left and right side of every element
  - create two empty arrays
  - iterate over input array with index
  - add integers from 0 index till current num to first left array
  - and from index + 1 till the end to the second array
- FIND the equal sums
  - by every iteration find sums of left array and right array
  - compare with each other
- RETURN index of num
  - when left == right return current index
- RETURN -1 if does not found
  - if iteration is ended, but no equals found
  - return -1
=end

# C
def find_even_index(array_nums)
  counter = 0
  loop do
    left = (array_nums.slice(0...counter)).sum
    right = (array_nums.slice((counter + 1)..-1)).sum
    return counter if left == right
    counter += 1
    break if counter == array_nums.size
  end
  - 1
end


p find_even_index([1,2,3,4,3,2,1]) #== 3
p find_even_index([1,100,50,-51,1,1]) #== 1
p find_even_index([1,2,3,4,5,6]) #== -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1
