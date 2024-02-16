# Repeated Substring

=begin
For a given non-empty string 's' find a minimum substring 't' and the maximum number 'k', 
such that the entire string 's' is equal to 't' repeated 'k' times. 
The input string consists of lowercase latin letters. 
Your function should return a tuple (in Python) (t, k) or an array 
(in Ruby and JavaScript) [t, k]

Example #1:

for string

s = "ababab"
the answer is

["ab", 3]
Example #2:

for string

s = "abcde"
the answer is

because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.
=end

# Input: string
# Output: array with substring and integer

def f(string)
  size = string.size
  returned = []
  size.times do |num|
    sub = string.slice(0..num)
    if (sub * (size / sub.size)) == string
      returned << sub << (size / sub.size)
      break
    else
      next
    end
  end
  returned
end

#0..1 -> 2 letters -> string size / 1 * 2 letters. size = 3 * 2 letters
p f("ababab") #== ["ab", 3]
p f("abcde") #== ["abcde", 1]
