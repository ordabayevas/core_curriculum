# Array.diff
=begin
Your goal in this kata is to implement a difference function, which subtracts one 
list from another and returns the result.
It should remove all values from list a, which are present in list b.

array_diff([1,2],[1]) == [2]
If a value is present in b, all of its occurrences must be removed from the other:

P
Input: two arrays
Output: array with difference

Rules:
- find all elements from the second array in first array
- delete them
- return elements from the first aray that are not presented in a second
- if first array is empty, return empty
- if second is empty, return first

E
[1,2], [1] ---> 1 is the element of the second, let's search in first arr element 1
                if we found element 1, we should remove it from the first.
                  result is [2]
[1,2,2], [1] ---> 1 is the element of the 2nd, and we found element 1 in the first. Remove
                  it from the 1st array.
                  result is [2, 2]
[1,2,2], [2]---> 2 is the element of the 2nd arr, we found 2 in the 1st arr. There are two 2.
                  Remove all of them.
                  result is [1]
[1,2,2], [] ---> there are no elements in the 2nd, nothing is deleted from the 1st arr.
                  result is [1, 2, 2]
[], [1,2] ---> search for the elem 1 in the 1st, but it's empty. we cannot delete any char.
                  result is []

D
Use arrays.

A
- FIND all elements from the second array in the first array
  - iterate over 2nd arr
  - check if 1st array include this element
- REMOVE all occurences of second arr elements in the first
  - if include, delete the element from the first
- RETURN elements that are last
  - return the first arr
=end

# C
def array_diff(arr1, arr2)
  arr2.each do |el|
    if arr1.include?(el)
      arr1.delete(el)
    end
  end  
  arr1
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
