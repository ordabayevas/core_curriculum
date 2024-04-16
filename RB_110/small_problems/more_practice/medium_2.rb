=begin

Now I Know My ABCs
A collection of spelling blocks has two letters per block, as shown in this list:
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

  Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.
P 
Input: string word 
Output: boolean

Rules:
- given blocks of spelling containing pairs of letters
- return true if given input does not include two letters from same pair block 
- ignore cases
- check every character and if the word has the second pair of this letter in a word, return false
- input does not have other digits or spaces and never empty

Examples:
'BATCH' --> B but no O , A but not N, T not G, C not P, H not U --> true
'BUTCH' --> B but no O , U and we have H --> False
'jest' --> j but no w, e not r, s not f, t but no g --> true 

D 
begin: input String
middle: use string to iterate every character, array with subarrays to contain pairs
end: boolean

A 
- CREATE a hash with pair of letters 
  - manually put every pair from condition every first letter will be the key and the second will be the value
- CHECK every letter for having these pairs of letters
  - iterate by every character
  - find this character in a hash as key and return it's value
  - check if this value in the word
- RETURN false if both letters from any pair is in the word
=end
PAIRS = {'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A', 'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U', 'V' => 'I', 'L' => 'Y', 'Z' => 'M'}

def block_word?(string)
  string.upcase.each_char do |char| # 'BATCH'
    if string.chars.include?(PAIRS[char]) # Pairs['O'] #it skips if we don't have the key
      return false
    end
  end
  true
end


p block_word?('OATCH') #== true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true

# p block_word?('OBATCH') == false