# Count letters in string 

# In this kata, you've to count lowercase letters in a given string 
# and return the letter count in a hash with 'letter' as key and count as 'value'. 
# The key must be 'symbol' instead of string in Ruby and 'char' instead of string 
# in Crystal.

# Example:

# letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
# =end

# def letter_count(string)
#   create empty hash
#   iterate over every letter of string
#   count this letter in a string
#   store this letter as a symbol and the integer of count as a value
#   delete the letter -------> will not work because we will change the length of iterated object
#   repeate previous steps till the last letter
#   return hash
# end

# Right solution:
# - write a method with 1 string arg
# - create a new empty hash
# - iterate over string chars
# - if hash has the key with iterated chars as a symbol, then add 1 to it's value
# - else create a new key-value, where key is a char converted to sym and value is 1
# - after the end of iteration return the hash

def letter_count(string)
  new_hash = {}
  string.each_char do |char|
    if new_hash.has_key?(char.to_sym)
      new_hash[char.to_sym] += 1
    else
      new_hash[char.to_sym] = 1
    end
  end
  new_hash
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}