# The Hashtag Generator
=begin
The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!

Here's the deal:

It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.
Examples
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false
=end

# P
# Input: string
# Output: hashtag
# Rules:
# - take a string and delete all whitespaces
# - prepend the hashtag sign 
# - capitalize every word
# - if result is longer than 140, return false
# - if string input is empty or whitespace, return false

# Implicit:
# - only result should be checked for length

# E
# "Codewars is nice" -> capitalize: "Codewars Is Nice"
# "Codewars Is Nice" -> delete whitespaces: "CodewarsIsNice"
# "CodewarsIsNice" -> prepend hashtag: "#CodewarsIsNice"

# false -> "", " ", "Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat"

# D
# Use an array to contain splitted words.

# A
# - CREATE an array of words from input string
#   - if string is valid string, split by whitespace
#     - check if input is '', ' ' return false
#     - else use #split with (' ')
# - TRANSFORM all words to capitalized
#   - iterate through words in array
#     - use #map
#   - capitalize every word
#     - use #capitalize
# - TRANSFORM array to a string
#   - convert array to a string
#     - use #join
# - RETURN the string with hashtag
#   - prepend the # to a string
#   - check the length of a final string
#     - if > 140 : false
#     - else: return string

def generateHashtag(string)
  if string.chars.all?(' ')
    return false
  end

  words = string.split(' ')
  words = words.map { |word| word.capitalize }
  output = words.unshift('#').join
  output.length > 140 ? false : output
end

p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false
