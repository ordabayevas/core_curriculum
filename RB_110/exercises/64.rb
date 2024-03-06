# Find the missing letter
=begin
Write a method that takes an array of consecutive (increasing) letters as 
input and that returns the missing letter in the array.

You will always get an valid array. And it will be always exactly one letter be missing. 
The length of the array will always be at least 2.
The array will always contain letters in only one case.

Example:
["a","b","c","d","f"] -> "e"
["O","Q","R","S"] -> "P"
(Use the English alphabet with 26 letters!)

P
Input: array of letters
Output: string, missing letter

Rules:
- create an alphabet
- return the missing letter from alphabet

E
["O","Q","R","S"] -> "P"

D
Use an array.

A
- CREATE arrays of letters, downcase and uppercase
  - alpha_upper = ('A'..'Z').to_a
  - alpha_down = ('a'..'z').to_a
- FIND the first letter and last letter in alphabet arrays
  - slice from the first letter till input array size + 1
- RETURN the difference letter
  - iterate over sliced array
  - and find if it is included to input array
=end
# require 'pry'
# require 'pry-byebug'
# C
def find_missing_letter(arr)
  alpha_down = ('a'..'z').to_a
  alpha_upper = ('A'..'Z').to_a
  if arr[0].downcase == arr[0]
    first_char = alpha_down.find_index(arr[0])
    last_char = alpha_down.find_index(arr[-1])
    alpha_arr = alpha_down.slice(first_char..last_char)
  else
    first_char = alpha_upper.find_index(arr[0])
    last_char = alpha_upper.find_index(arr[-1])
    alpha_arr = alpha_upper.slice(first_char..last_char)
  end
  
  alpha_arr.each do |char|
    if !arr.include?(char)
      return char
    end
  end
end

p find_missing_letter(["O","Q","R","S"])# -> "P"

# better solution
# def find_missing_letter(arr)
#   ((arr.first..arr.last).to_a - arr).first
# end