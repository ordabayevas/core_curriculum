# Find The Parity Outlier
=begin
You are given an array (which will have a length of at least 3, but could be very large) 
containing integers. The array is either entirely comprised of odd integers or 
entirely comprised of even integers except for a single integer N. Write a method 
that takes the array as an argument and returns this "outlier" N.

Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

P
Input: array of nums
Output: the num

Rules:
- take an array of nums
- divide nums by even and odd
- return the element of array with 1 element

E
[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

D
Arrays.

A
- SORT elements by even and odd
- RETURN the element of array with only one element
=end

# C
def find_outlier(array)
  odd, even = array.partition do |num|
    num.odd?
  end

  odd.size == 1 ? odd[0] : even[0]
end

p find_outlier([160, 3, 1719, 19, 11, 13, -21])
