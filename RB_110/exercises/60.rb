# Count letters in string
=begin
In this kata, you've to count lowercase letters in a given string and 
return the letter count in a hash with 'letter' as key and count as 'value'. 
The key must be 'symbol' instead of string in Ruby and 'char' instead of 
string in Crystal.

P
Input: string
Output: hash

Rules: 
- count every letter in a string
- write as a symbol key of hash every character
- count as a value of hash

E
'arithmetics' -> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

D
Use array to count

A
- TRANSFORM string to array of symbols
- COUNT every symbols occurence in array
- CREATE a hash with symbols and their occurences
=end

def letter_count(string)
  sym_arr = string.chars.map { |char| char.to_sym }
  sym_hsh = {}
  sym_arr.each do |sym|
    if sym_hsh.has_key?(sym)
      next
    else
      sym_hsh[sym] = sym_arr.count(sym)
    end
  end
  sym_hsh
end

p letter_count('arithmetics') ==  {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
