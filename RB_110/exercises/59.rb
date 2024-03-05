# Find the Nexus of the Codewars Universe
=begin
Not to brag, but I recently became the nexus of the Codewars universe! 
My honor and my rank were the same number. I cried a little.

Complete the method that takes a hash/object/directory/association list of users, 
and find the nexus: the user whose rank is the closest is equal to his honor. 
Return the rank of this user. For each user, the key is the rank and the value 
is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest. 
If there are several users who come closest, return the one with the lowest rank 
(numeric value). The hash will not necessarily contain consecutive rank numbers; 
return the best match from the ranks provided.

P 
Input: hash
Output: integer key

Rules:
- compare keys and values
- return the key, where difference between the key and value is the smallest

E
Example
         rank    honor
users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,    <--- nexus
          23  =>  11,
          30  =>   2 }

D 
Use a hash

A 
- FIND the difference between value and key, make it positive
  - create arrays of keys and values separate
  - iterate over keys array
  - from every num of keys array subtract the same positioned num from values array
  - the difference add to new array
- RETURN the key of the smallest difference
  - the smallest difference indexed num from key
=end

# C
def nexus(hash)
  keys = hash.keys
  values = hash.values
  diff = {}
  keys.each_with_index do |key, idx|
    difference = values[idx] - key
    difference *= (-1) if difference < 0
    diff[key] = difference
  end

  diff.sort_by { |k, v| [v, k] }[0][0]
end

p nexus({1 => 3, 3 => 3, 5 => 1}) #== 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1})# == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) #== 2
p nexus({30=>5, 25=>10, 20=>15, 15=>20, 10=>25, 5=>30})

# shorter solution
# def nexus(users)
#   users.min_by{ |rank, honor| [(rank - honor).abs, rank] }[0]
# end
