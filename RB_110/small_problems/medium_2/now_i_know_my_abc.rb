# sentences = text.split(/\.|\?|!/)
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# hash = {'B' => 'O', 'G' => 'T', 'V' => 'I', 'X' => 'K', 'R' => 'E', 'L' => 'Y', 'C' => 'P', 'J' => 'W', 'N' => 'A', 'H' => 'U'}
# array = hash.to_a

def block_word?(word)
  if word.upcase.include?("B") && word.upcase.include?("O")
    false
  elsif word.upcase.include?("G") && word.upcase.include?("T")
    false
  elsif word.upcase.include?("V") && word.upcase.include?("I")
    false
  elsif word.upcase.include?("X") && word.upcase.include?("K")
    false
  elsif word.upcase.include?("R") && word.upcase.include?("E")
    false
  elsif word.upcase.include?("L") && word.upcase.include?("Y")
    false
  elsif word.upcase.include?("C") && word.upcase.include?("P")
    false
  elsif word.upcase.include?("J") && word.upcase.include?("W")
    false
  elsif word.upcase.include?("N") && word.upcase.include?("A")
    false
  elsif word.upcase.include?("H") && word.upcase.include?("U")
    false
  else
    true
  end
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true

# LS solution
# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end