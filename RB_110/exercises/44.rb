# Sort Arrays (Ignoring Case)
=begin
Sort the given strings in alphabetical order, case insensitive. For example:

["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]

P
Input: array of strings
Output: sorted array of strings

Rules:
- sort strings in alphabetical order
- ignore cases
- return in the same cases as original

E
["Hello", "there", "I'm", "fine"] -> 'fine', 'Hello', 'I'm', 'there'

D
Use new array to sort the same strings.

A
- SORT by alphabetical order
  - 
- TRANSFORM strings to downcases
- RETURN sorted original strings in a new array
=end

# C
def sortme(array)
  array.sort { |a, b| a.downcase <=> b.downcase }
end


p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]

# Solution from Codewars
# def sortme( names )
#   names.sort_by(&:downcase)
# end