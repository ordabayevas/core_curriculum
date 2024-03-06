# Which are in?
=begin
Given two arrays of strings a1 and a2 return a sorted array r in 
lexicographical order of the strings of a1 which are substrings of strings of a2.

#Example 1: a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

#Example 2: a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []

Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.

In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.

Beware: r must be without duplicates.
Don't mutate the inputs.

P
Input: two arrays with strings
Output: array with sorted substrings

Rules:
- take two arrays a1 and a2 with strings
- if strings in array a1 are substrings of strings of array a2
- return strings that match in array r in alphabetical order

E
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
arp is a sub of harp, sharp
live is a sub of lively, alive
strong is a sub of armstrong

D
Use an array.

A
- SELECT strings from the first array, that are substrings of words in the second
  - iterate over first array
    - use #each
  - iterate over second aray
    - inside the loop, start new loop #each
- ADD and SORT the new array r with selected strings
- RETURN the array r
=end

# C
# def in_array(arr1, arr2)
#   r = []
#   arr1.each do |str1| # 'arp'
#     arr2.each do |str2| # 'lively'
#       if str2.include?(str1)
#         r << str1
#       end
#     end
#   end
#   r.uniq.sort
# end

# a1 = ["arp", "live", "strong"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# a1 = ["tarp", "mice", "bull"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
# p in_array(a1, a2)
require 'pry'
require 'pry-byebug'

def in_array(arr1, arr2)
  arr1.select do |str1| # 'arp'
    a = arr2.map do |str2| # 'lively'
      str2.include?(str1)
    end
    a.any?
  end
end

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# a1 = ["tarp", "mice", "bull"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
p in_array(a1, a2)