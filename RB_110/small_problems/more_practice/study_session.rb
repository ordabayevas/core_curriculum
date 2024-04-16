# Given a collection of integers, write a method to return a new collection 
# of every unique contiguous subarray in that collection with an even sum. 
# The returned subarrays can be in any order.
=begin
P
Input: array of integers
Output: nested array with subarrays of integers

Rules:
- add integers to each other 1 by 1
- if sum is even num
- return the nums of input array as a subarray
- then proceed till the end of the array
- order of subarrays can be any

E
[1, 2, 3, 4, 5] --> 
1 (not even)
1 + 2 = 3 (not even) + 3 = 6 (even)
first subarray --> [1, 2, 3]
6 + 4 = 10 (even) --> second subarray -> [1, 2, 3, 4]
10 + 5 = 10 (not even)

2 --> even num
2 + 3 = 5 + 4 = 9 + 5 = 14 --> even num
3 --> not even, skip
3 + 4 = 7 + 5 = 12 (even)
4 --> even
4 + 5 = 9 --> not even
5 --> not even

D
begin: array
middle: array, integers
end: nested array

A
- FIND all subarrays starting with length of 1 element
- initialize times method on first string size and define block parameter as a first el
  - initialize inner loop from 1 to the size of array, and define parameter as a length
  - add to empty array the sliced subarray with start and length
- FIND the sum of every subarray
  - select subs that have even sum
- ADD subarrays with even sum to a new array
  - add selected to a new array
- RETURN this array
  - remove copies if selected array contains duplicates
=end

# C
def even_subs(arr_int)
  all_subs = []
  max_range = arr_int.size
  arr_int.size.times do |start|
    1.upto(max_range) do |length|
      all_subs << arr_int[start, length]
    end

    max_range -= 1
  end
  
  selected = all_subs.select do |sub|
    sub.sum.even?
  end

  selected.uniq
end

p even_subs([1, 1, 1, 1, 1]).sort == [[1, 1], [1, 1, 1, 1]]
p even_subs([1, 2, 3, 4, 5]).sort == [[1, 2, 3], [1, 2, 3, 4], [2], [2, 3, 4, 5], [3, 4, 5], [4]]
p even_subs([88, 54, 67, 56, 36]).sort == [[36], [54], [56], [56, 36], [88], [88, 54]]