# Sherlock on pockets
=begin
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. 
Suspect in this case is a person which has something not allowed in his/her pockets.
Allowed items are defined by array of numbers.
Pockets contents are defined by map entries where key is a person and value is 
one or few things represented by an array of numbers (can be nil or empty array if empty), 

example:

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

Write a method which helps Sherlock to find suspects. If no suspect is found or 
there are no pockets (pockets == nil), the method should return nil.

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]
=end

=begin
P
Input: hash and array
Output: array with selected keys from hash

Rules:
- write a method that takes 2 input
- first hash contains the keys with person's name and value's with object's in their pockets
- and the second array contains the things that allowed to be in pockets
- return the keys in array, that have objects that are not in the array

E
find_suspects(pockets, [1, 2])
pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
}
[1, 2] --> objects that could be in pockets
bob has 1 -> allowed
tom has 2, 5 -> 5 is not allowed
jane has 7 -> 7 is not allowed
return jane and tom

D
Hash and array.

A
- FIND not allowed objects, check every value of key in a hash
  - iterate over hash -> tom: [2, 5] [1, 2]
  - iterate over every value of key
  - check if every element of value in array
- CREATE an array with keys, that have not allowed objects
  - initialize new empty array
  - if has object that returns false in the previous step
  - add key to the empty array
=end

# C
def find_suspects(hash, array)
  suspects = []
  hash.each do |key, value|
    next if value.nil? || value.empty?
    value.each do |obj|
      if !array.include?(obj)
        suspects << key
      end
    end
  end

  suspects.empty? ? nil : suspects.uniq
end

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

# p find_suspects(pockets, [1, 2]) == [:tom, :jane]
# p find_suspects(pockets, [1, 7, 5, 2]) == nil
# p find_suspects(pockets, []) == [:bob, :tom, :jane]
# p find_suspects(pockets, [7]) == [:bob, :tom]
p find_suspects({:julia=>nil, :meg=>[]}, [1, 2])