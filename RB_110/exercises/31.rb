# Split Strings
=begin
Complete the solution so that it splits the string into pairs of two characters. 
If the string contains an odd number of characters then it should replace the 
missing second character of the final pair with an underscore ('_').
=end

=begin
P 
Input: string
Output: array of string divided by two chars pairs

Rules:
- take a string
- split every two chars
- if num of chars is odd, add underscore to match the pair
- if empty, return empty array

E 
"abcdef" -> 6 letters, ab, cd, ef
"abcdefg" -> 7 letters, ab, cd, ef, g_

D 
Create a new array for substrings.

A 
- FIND the odd or even num of chars in a string
  - find a string size
  - if size odd, add to the end underscore
- CREATE an array of pair letters
  #1  
  - create holders
    - create an empty array
    - create a variable
  - iterate over the string
    - add to a variable while its size is not 2
    - add variable to an array
    - clear the variable

    #2
    - iterate
      - (string.size / 2).times
    - divide
      - slice(idx * 2, 2) -> 0, 2, 4
    - push to array

- RETURN the array
  - return array of subs after iteration
=end

# C
def solution(string)
  string.size.odd? ? string.concat('_') : string

  subs = []
  (string.size / 2).times do |i|
    sub = string.slice((i*2), 2)
    subs << sub
  end

  subs
end

p solution('abc') #== ['ab', 'c_']
p solution("abcdef") #== ["ab", "cd", "ef"]
p solution("abcdefg") #== ["ab", "cd", "ef", "g_"]
p solution("") #== []
