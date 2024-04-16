=begin
P
Input: array of integers
Output: max sum of subarray
Rules: 
- find a max sum of subsequent integers
- if all integers are positive, return the sum of all
- empty array has a 0 sum and counts like a valid input
- if array has only neg numbers, return 0

E
[-2, 1, -3, 4, -1, 2, 1, -5, 4] --> [4, -1, 2, 1] == 6
[-2, 1, -7, 4, -10, 2, 1, 5, 4] --> 12

[3, -7, 4, -10, 12]
0 0-2 0-4
2 2-4
4

D
begin: array of int
middle: 
end: integer

A
- FIND and SUM if in array neg numbers in a row or pos numbers in a row
  - check if array is all from neg nums or empty, return 0 if true
  - iterate over array and if it has subsequent pos nums or subsequent neg nums, sum them
- REMOVE neg integers from the beginning and the end of the array
  - check if first and last are negative
    - if yes, remove them
- DIVIDE by substrings the modified array, every subarray starts and ends from the pos num
  - iterate over array
  - find all subarrays that starts from even index with length 3
- ADD all subarrays in one array
  - create an empty array and add them
- FIND the sum of all subarrays
  - iterate over the array
- RETURN the max
=end

# C
# def simplify(array)
#   new = [array[0]] # [9]
#   array.each_with_index do |el, i|
#     if i == 0
#       next
#     elsif (new[-1] > 0) && ( el > 0) # 2, 3, 4, -1
#       new[-1] = new[-1] + el
#     elsif (new[-1] < 0) && ( el < 0)
#       new[-1] = new[-1] + el
#     else
#       new << el
#     end
#   end

#   if new.first < 0
#     new.shift
#   end

#   if new.last < 0
#     new.pop
#   end

#   new
# end

# def maxSequence(array)
#   return 0 if array.empty? || array.all? {|n| n < 0 }

#   array = simplify(array) # [3, -7, 4, -10, 12]
  
#   subarray_sums = []
#   start_idx = 0
#   loop do
#     length = 1

#     loop do
#       subarray_sums << array.slice(start_idx, length).sum
#       length += 2
#       break if length > (array.size - start_idx)
#     end

#     start_idx += 2
#     break if start_idx > array.size
#   end

#   subarray_sums.max
# end

# p maxSequence([-2, 1, -7, 4, -10, 2, 1, 5, 4])
# p maxSequence([-2, 1, -3, 4, -1, 2, 1, -5, 4])
# p maxSequence([])
# p maxSequence([11])
# p maxSequence([-32])

=begin
Common prefix
Input: array of strings
Output: string

Rules:
- take an array of strings
- find the longest matched first letters
- if no first matched letters, return empty string
- if letters match in the middle or in the end, return empty

E
['flower', 'flight', 'flow'] --> 'fl'
['dog', 'racecar', 'car'] --> ''

D
begin: array, string
middle: string
end: string

A
- FIND the matched letters from the beginning of every word
  - iterate over letters in elements
  - create an empty string
  - if first letter is the same for all elements in array, add to new string
  - if second letter is the same for all elements, add to string
  - if first one is not matches, return empty
- RETURN that string
=end

# C
def common_prefix(array_str)
  index = 0
  string = ''
  min_word = array_str.map {|word| word.size}.min
  loop do
    if array_str.all? {|word| word[index] == array_str[0][index]}
      string << array_str[0][index]
      index += 1
      break if index == min_word
    else
      break
    end
  end
  string
end

p common_prefix(['flower', 'flight', 'flow']) #--> 'fl'
p common_prefix(['dog', 'racecar', 'car']) #--> ''
p common_prefix(['throne', 'throne'])

# array = [1, 2, 3, 4, 5]
# [1,2,3], [2,3,4], [3,4,5]
# 0, 3   1,3   2,3

# subs = []
# length = 3
# (array.size - 2).times do |start|
#   subs << array[start, length]
# end

# p subs