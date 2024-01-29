# Given the array...
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# Write a program that prints out groups of words that are anagrams. 
# Anagrams are words that have the same exact letters in them but in a different order. 
# Your output should look something like this:
# ["demo", "dome", "mode"]
# ["neon", "none"]
#(etc)

# 'demo' -> ["demo", "dome", "mode"]
# 'enno' -> ["neon", "none"]

def anagrams(array)
  new_hash = {}
  array.each do |word|
    sorted_word = word.chars.sort
    if new_hash.has_key?(sorted_word)
      new_hash[sorted_word] << word
    else
      new_hash[sorted_word] = [word]
    end
  end
  new_hash.each_value {|value| p value}
end

anagrams(words)


