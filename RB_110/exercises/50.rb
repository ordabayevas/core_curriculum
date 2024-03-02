# Where is my parent!?(cry)
=begin
Mothers arranged a dance party for the children in school. At that party, 
there are only mothers and their children. All are having great fun on the dance 
floor when suddenly all the lights went out. It's a dark night and no one can see 
each other. But you were flying nearby and you can see in the dark and have ability 
to teleport people anywhere you want.

Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, i.e. 
"A" mother's children are "aaaa".
-Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, 
i.e. "aAbaBb" => "AaaBbb".

P
Input: string of unordered chars
Output: sorted by alphabet

Rules: 
- re-order the string, so first goes big letter, and the small version of it follows.

E

=end

# C
def find_children(string)
  string_arr = string.chars.sort
  hash = {}
  string_arr.each do |char|
    if char.upcase == char
      hash[char] = ''
    elsif hash.has_key?(char.upcase)
      hash[char.upcase] << char
    end
  end
  hash.to_a.flatten.join
end


p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""

# def find_children(dancing_brigade)
#   dancing_brigade.chars.sort_by { |char| [char.downcase, char] }.join
# end