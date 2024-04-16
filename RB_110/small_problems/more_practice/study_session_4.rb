=begin
Problem # 1
Write a function called longestConsecutiveAscendingWords that 
takes a sentence as input and finds all consecutive word  where the succeeding word is longer than the previous. The function should return an array of these pairs. Punctuation marks should be considered part of a word (e.g., "hello," and "hello" are different words). - Udeshika

# Test cases
puts longest_consecutive_ascending_words("The quick brown fox jumps over the lazy dog").inspect # [ 'The', 'quick' ]
puts longest_consecutive_ascending_words("A journey of a thousand miles begins with a single step").inspect # [ 'A', 'journey' ]
puts longest_consecutive_ascending_words("Easy come easy go").inspect # [ 'Easy' ]
puts longest_consecutive_ascending_words("Tiny bird flew over the peaceful countryside").inspect # [ 'the', 'peaceful', 'countryside' ]

Problem # 2
# Given 2 two arguments of an array of numbers and a number, find all the pairs that results in the forming a triangle with the number. 
# Note: To determine if three numbers form a triangle you have touse the Triangle Inequality Theorem, which states that the sum of two side lengths of a triangle is always greater than the third side. If this is true for all three combinations of added side lengths, then you will have a triangle. -- Tiia
# Test cases
puts find_triangle_pairs([2, 3, 4, 5], 7).inspect # [ [ 3, 5 ], [ 4, 5 ] ]
puts find_triangle_pairs([1, 2, 3, 4], 10).inspect # []
puts find_triangle_pairs([7, 10, 12, 15], 9).inspect # [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
puts find_triangle_pairs([8, 2, 5, 6, 3], 4).inspect # [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]
=end

Problem # 3
# Write a function that finds all substrings that doesn’t contain any of the prohibited characters given in the second argument. -- Amar

# Test cases
puts find_valid_substrings("test", "t").inspect # [ 'e', 'es', 's' ]
puts find_valid_substrings("hello", "el").inspect # [ 'h', 'o' ]
puts find_valid_substrings("12345", "3").inspect # [ '1', '12', '2', '4', '45', '5' ]
puts find_valid_substrings("abcde", "xyz").inspect
# [
#   'a', 'ab', 'abc', 'abcd', 'abcde', 'b',
#   'bc', 'bcd', 'bcde', 'c', 'cd', 'cde',
#   'd', 'de', 'e'
# ]

=begin
# Problem # 4
# Given a sentence, find all pairs of words whose first letter matches the 
# last letter of its pair. Return an empty array if there’s no such pair. 
# Only consider words that have at least length of 2 for the pairings. -- Saltanat
=begin
P
Input: string
Output: array of pair strings

Rules:
- return an array of two words where the first letter of the first word and the last letter of the second word are the same
- if word is just 1 letter do not consider it as a word
- return empty if there is no such pairing

E 
"The cat in the hat" -> The cat (because first and last is T), The, hat, the hat
"A man a plan a canal Panama" -> [] a is not a word

D 
begin: string 
middle: array of words
end: array of two words

A
- DIVIDE by words
  - split
- FIND the pair for every word
  - iteration over every word
  - every current word match it with other words
  - use times method for first loop
  0 1
  0 2
  0 3
  0 4

  1 2
  1 3
  1 4

  2 3
  3 4

  3 4

  4(we do not need 1 word only)
  - and use the second upto method for the inner loop to have the second word
  
- SELECT only those where every first and last are the same
- RETURN SUBARRAYS IN ARRAY



# Test cases
puts find_matching_pairs("The cat in the hat").inspect # [["The", "cat"], ["The", "hat"], ["the", "hat"]]
puts find_matching_pairs("A man a plan a canal Panama").inspect # []
puts find_matching_pairs("This sentence has no pairs").inspect # [["sentence", "has"], ["sentence", "pairs"]]
puts find_matching_pairs("Apple leads to leap").inspect # []

def find_matching_pairs(string)
  words = string.split(' ')
  new_words = []
  words.size.times do |start|
    (start + 1).upto(words.size - 1) do |last|
      new_words << [words[start], words[last]]
    end
  end

  new_words.select do |pair|
    pair[0][0].downcase == pair[1][-1] && pair[0].size > 1 && pair[1].size > 1
  end
end

puts find_matching_pairs("The cat in the hat").inspect # [["The", "cat"], ["The", "hat"], ["the", "hat"]]
puts find_matching_pairs("A man a plan a canal Panama").inspect # []
puts find_matching_pairs("This sentence has no pairs").inspect # [["sentence", "has"], ["sentence", "pairs"]]
puts find_matching_pairs("Apple leads to leap").inspect # []
=end