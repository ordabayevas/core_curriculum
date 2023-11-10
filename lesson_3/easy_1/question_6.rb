# first way
famous_words = "seven years ago..."
famous_words.insert(0, "Four score and ") # mutates the original

puts famous_words

# second way
famous_words = "seven years ago..."
add = "Four score and "

puts add + famous_words # non-mutating way
puts famous_words
puts add

# LS solutions
"Four score and " + famous_words # non-mutating

famous_words.prepend("Four score and ") # mutating

"Four score and " << famous_words # non-mutating in this case, because we added to a string variable, not vice versa
