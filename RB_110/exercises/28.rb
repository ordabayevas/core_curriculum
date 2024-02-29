# Mean Square Error
=begin
Complete the function that:
- accepts two integer arrays of equal length
- compares the value each member in one array to the corresponding member in the other
- squares the absolute value difference between those two values
- and returns the average of those squared absolute value difference between each member pair.
Examples
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2
=end

=begin
P
Input: 2 arrays with integers of the same length
Output: integer, average square of squared differences
Rules:
- compare integers from two arrays with the same index
- square all differences
- find the mean of squared differences

E 
[-1, 0], [0, -1]
-1 - 0 = -1 -> (-1)**2 = 1
0 - (-1) = 1 -> (1)**2 = 1
(1 + 1) / 2 = 1

D 
Use a third array for squares.

A 
- FIND a difference between two the same positioned numbers
  - iterate over the first array with index
    - use #each_with_index with num and idx
  - from the second array num subtract the first array num
    - difference = array2[idx] - num
- CREATE an array of squared differences
  - initialize the variable with empty array
    - squares = []
  - push all differences in second power to empty array
    - squares << differences
- RETURN the average value of squares
  - sum all nums in array
    - squares.sum
  - divide by num of all elements in array
    - sum / length
=end

def solution(arr1, arr2)
  squares = []
  arr1.each_with_index do |num, idx|
    difference = arr2[idx] - num
    squares << difference**2
  end

  squares.sum.to_f / squares.length
end



p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1
