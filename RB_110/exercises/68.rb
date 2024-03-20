# Reversing and Combining Text
=begin
Your task is to Reverse and Combine Words.
Input: String containing different "words" separated by spaces

1. More than one word? Reverse each word and combine first with second, third 
    with fourth and so on...
  (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…
=end

=begin
P
Input: string with words
Output: string with reversed words and no spaces

E
"abc def ghi jkl" --> cbafed ihglkj -> defabcjklghi

D
strings, arrays

A
- TRANSFORM string to array of words
  - if in a string only 1 word, return word without modifying
  - if more than 2, separate by spaces each word
- REVERSE every word
  - iterate over array of words
  - reverse every word
- COMBINE words by pairs -> 1 and 2, 3 and 4 and so on
  - iterate with simple loop and counter
  - concatenate by index
  - add to another array
  - if there are still more than 1 word, repeat reverse and combine
- RETURN the last string
  - convert array with 1 string to string
=end

# C
def reverse_and_combine_text(string)
  if !string.include?(' ')
    return string
  end

  words = string.split(' ')
  words.map do |word|
    word.reverse!
  end

  counter = 0
  new_words = []
  loop do
    new_words << (words[counter] + words[counter + 1])
    counter += 2
    break if new_words.size == (words.size / 2)
  end

  new_words << words[-1] if words.size.odd?

  if new_words.size > 1
    reverse_and_combine_text(new_words.join(' '))
  else
    new_words.join
  end
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"
# 12 34 56 78 9
# 2143 6587 9
# 34127856 9
# 658721439