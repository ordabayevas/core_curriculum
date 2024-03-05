# Grouping and Counting
=begin
Your goal is to write the group_and_count method, which should receive an array 
as a unique parameter and return a hash. Empty or nil input must return nil instead 
of a hash. This hash returned must contain as keys the unique values of the array, 
and as values the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}

The following methods were disabled:
Array#count
Array#length

P
Input: array
Output: hash or nil

Rules:
- take array and convert to hash
- if array empty or nil return nil
- elements in array should be keys
- values the count of elements

E
[1,1,2,2,2,3] --> {1 => 2, 2 => 3, 3 => 1}

D
Create a hash to add values.

A
- RETURN nil if input is empty or nil
- CREATE new hash
- TRANSFORM elements of array to keys, count of elements to values
- RETURN hash
=end

# C
def group_and_count(array)
  return nil if array.nil? || array.empty?

  new_hash = {}
  array.each do |el|
    if new_hash.has_key?(el)
      new_hash[el] += 1
    else
      new_hash[el] = 1
    end
  end
  
  new_hash
end

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}
