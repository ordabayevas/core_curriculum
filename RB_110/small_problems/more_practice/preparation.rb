=begin
# 1 - Minimum shorten
Implement the function/method, minimum shorten. The function shortens a
sentence such that it will fit within the character limit set. It shortens by removing vowels 
in the sequence of a, e, i, o, and u. Start removing from the end of the sentence. 
  If it can not be shortened to fit within character limit, return an empty string. 
  Spaces don’t count for the limit.

P 
Input: string sentence, integer 
Output: string sentence 

Rules: 

E 
a, e, i, o, u.
'This is a test sentence', 18 -> 4 spaces do not count, removed 'a' and then the sentence is 18 and we do not need to shorten it anymore.
'Hello World', 8 -> 'Hllo Wrld', no 'a', then removed 'e', no 'i', then removed 'o' and reached 8.
'A very long sentence with many vowels', 10 -> we cannot reach a char limit with removing vowels, return empty 
'Short', 10 -> string is 5 chars, and limit is 10, do not remove anything because it is within limit, return the string itself 

D 
begin: string, integer 
middle: string to iterate 
end: string 

A 
- check first if string is bigger than given Integer, if string.delete(' ').size > integer
  - reverse it 
  - start iteration over a, e, i, o, u this sequence  # each
  - iteration over every char in a string and if char is equal to current char like 'a' then assign string index to empty string #each_with_index
  - check for current char, and remove it permanently.
  - check again for size of string.delete(' ').size == integer
  - if false 
  - go to the next iteration loop and look for the next char 
  - repeat till string.delete(' ').size == integer will be true 
=end 

# def minimum_shorten(string, limit)
#   return string if limit >= string.delete(' ').size

#   vowels = ['a', 'e', 'i', 'o', 'u']
#   new_str = string.reverse # "ecnetnes tset a si sihT" | "dlroW olleH"
#   vowels.each do |vowel| # 'a'
#     index = 0
#     loop do
#       if new_str[index] == vowel
#         new_str[index] = '#'
#         return new_str.reverse.delete('#') if new_str.delete(' ').delete('#').size == limit
#       end
#       index += 1
#       break if index == string.size + 1
#     end
#   end
#   ''
# end

# def delete_vowel(string, vowel)
#   reversed = string.reverse
#   index = reversed.index(vowel)
#   reversed[index] = ''
#   reversed.reverse
# end

# def minimum_shorten(string, limit)
#   return string if limit >= string.delete(' ').size

#   vowels = ['a', 'e', 'i', 'o', 'u']
#   vowels.each do |vowel| #a e
#     while string.include?(vowel) do
#       string = delete_vowel(string, vowel)
#       if string.delete(' ').size == limit
#         return string
#       end
#     end
#   end
#   ''
# end

# p minimum_shorten('This is a test sentence', 18) #== 'This is  test sentence'
# p minimum_shorten('Hello World', 8) #== 'Hllo Wrld'
# p minimum_shorten('Short', 10) #== 'Short'
# p minimum_shorten('A very long sentence with many vowels', 10) #== ''

#========================================================================
=begin
# 2 - Check consecutive numbers
Given an array of numbers, return true if any 5 consecutive numbers 
are greater than 3. If there are less than 5 numbers in the array, return 
true if all are greater than 3.

P
Input: array of ints
Output: boolean
Rules:
- find all 5 consecutive numbers
- return true if at least one of the sequence of 5 nums has all of the 5 numbers > 3
- if there are less than 5 numbers in array and they are all greater than 3, return true
- if less nums but any of them is less than 3, return false

E
4, 5, 6, 7, 8 =>
there only 1 sequence, they are all greater than 3

[2, 4, 5, 6, 7, 8] =>
2, 4, 5, 6, 7 = false
4, 5, 6, 7, 8 =>
true

D
begin: arr of ints 
  middle: subarrays
end: boolean

A 
- FIND all consecutive numbers from first element till the end with length 5
  - size times do
  - length 5
  - break if index == size - length # if len = 5, 5 - 5 = 0, iteration stops after 1 iteration
- CHECK if #any of them has #all values greater than 3
- RETURN true or false
=end

# def check_consecutive_numbers(array)
#   if array.size < 5 
#     return array.all? {|num| num > 3 }
#   end

#   subs = []
#   length = 5
#   array.size.times do |start| # upto is better
#     subs << array[start, length]
#     break if start == array.size - length
#   end

#   subs.any? do |sub|
#     sub.all? do |num|
#       num > 3
#     end
#   end

# end

# p check_consecutive_numbers([4, 5, 6, 7, 8]) # true
# puts check_consecutive_numbers([2, 4, 5, 6, 7, 8]) # true
# puts check_consecutive_numbers([1, 2, 3, 4, 5]) # false
# puts check_consecutive_numbers([4, 4]) # true (less than 5 numbers, all greater than 3)
# puts check_consecutive_numbers([2, 2]) # false (less than 5 numbers, not all greater than 3)

#========================================================================
=begin
# 3 - Mask sentence
# Write a function that masks proper nouns and numbers in a sentence. 
Use * to mask proper nouns and use # to mask numbers. You may assume that a 
sentence will not begin with a proper noun and will not end with a number 
or proper noun. Numbers can only be integers.

Input: string
Output: modified string

Rules:
- find all proper nouns except the first and last word of the sentence
- find all nums, except the last word
- replace proper nouns with *
- replace numbers with #
- numbers can only be integers

"Alice and Bob went to Paris in 2021 to have a vacation." => Alice and *** went to ***** in #### to have a vacation.

Algorithm:
- DIVIDE by words
    - if word starts from capitalized letter or number
      - word[0] == word[0].upcase ---> iterate over words[1..-2]
      - word[0].to_i.to_s == word[0] ---> iterate over words[0..-2]
    - replace it with asterisk and #
- join words

def mask_sentence(string)
  words = string.split(' ')
  words[1..-2].each do |word|
    if (word.to_i.to_s != word) && (word[0] == word[0].upcase)
      word.replace('*' * word.size)
    end
  end

  words[0..-2].each do |word|
    if word.to_i.to_s == word
      word.replace('#' * word.size)
    end
  end

  words.join(' ')
end


# Test cases
puts mask_sentence("They bought 5 apples from John yesterday.")  
# They bought # apples from **** yesterday.
p mask_sentence("Alice and Bob went to Paris in 2021 to have a vacation.") 
# Alice and *** went to ***** in #### to have a vacation.
=end

#========================================================================
=begin
# 4 - Negate

Write a function, negate, that converts all “yes” words to "no" and "no" 
words to "yes" in a sentence. The comparison for "yes" and "no" should be case 
insensitive."yes" and "no" should be negated even if ending with ., ?, ,, or !.

P 
Input: string
Output: modified string

Rules:
- replace yes with no
- replace no with yes
- words are case insensitive
- words have punctuation signs

E
"Yes, I said no but now I say yes." -> remove comma, and add again 'No,' 'yes' delete dot, and add again 'no.'
"Yesterday is not today?" -> we cannot just check first words.

D
begin: string
  middle: array to contain words
end: string

A 
- CREATE an array of words from input string
  - split by spaces
- FIND all 'yes' in different cases and with signs at the end and replace with no in the same formatting
  - iterate over words with map
  - write an extra method is_yes? and give arg every word of array
    - inside the method every word in downcase and without sign at the end check for equality with word 'yes'
    - return true or false to main method
  - if is_yes? is true -> replace with no in the same way
    - create a method yes_format and give the current yes as arg
      - if yes capitalized, capitalize word no
      - if yes has a sign, add a sign to word no
      - return No in the same format as arg
  - returned word return to array or remain the same word
- FIND all 'no' in different cases and with signs at the end and replace with 'yes'in the same formatting
- CONVERT array to string with all words and return

def is_yes?(word)
  word.downcase.delete('.').delete('!').delete('?').delete(',') == 'yes'
end

def is_no?(word)
  if ('a'..'z').to_a.include?(word[-1].downcase)
    word.downcase == 'no'
  else
    word[0..-2].downcase == 'no'
  end
end

def yes_to_no_format(word) # Yes,
  new_word = 'no'
  if word[0] == word[0].upcase
    new_word = new_word.capitalize
  end

  if !('a'..'z').to_a.include?(word[-1].downcase)
    new_word << word[-1]
  end
  
  new_word
end

def no_to_yes_format(word)
  new_word = 'yes'
  if word[0] == word[0].upcase
    new_word = new_word.capitalize
  end

  if !('a'..'z').to_a.include?(word[-1].downcase)
    new_word << word[-1]
  end
  
  new_word
end

def negate(string)
  words = string.split(' ')

  words.map do |word|
    if is_yes?(word)
      yes_to_no_format(word)
    elsif is_no?(word)
      no_to_yes_format(word)
    else
      word
    end
  end.join(' ')
end

# Test cases
puts negate("Yes, I said no but now I say yes.") == "No, I said yes but now I say no."
puts negate("no way, yes way!") == "yes way, no way!"
puts negate("Yesterday is not today?") == "Yesterday is not today?"
puts negate("No, I do not know!") == "Yes, I do not know!"
# puts is_no?("No,")
# puts no_to_yes_format("No,")
=end

#========================================================================
=begin
# 5 - Capitalize
1:23
Implement a function, capitalize, that capitalizes all words in a sentences. 
However, only capitalize if the word is followed by a word starting with a vowel 
(for Ruby don’t use capitalize).

P 
Input: string
Output: modified string

Rules: 
- if after word is a word with first vowel letter, capitalize word
- if not, remain the case

E
"hello apple world" --> Hello apple world
"every vowel starts an echo" --> every vowel Starts An echo

D
begin: string
  middle: array  of words
end: string

Algorithm:
- CREATE an array of words
  - split
- CAPITALIZE word if next word starts with vowel [a, e, i, o, u]
  - iterate over array of words each with index
  - if next word[0] is in vowels array, current word[0] = word[0].upcase
- RETURN modified string
  - join array of words

def capitalize(string)
  words = string.split(' ')
  vowels = ['a', 'e', 'i', 'o', 'u']
  words[0..-2].each_with_index do |word, idx|
    if vowels.include?(words[idx + 1][0])
      word[0] = word[0].upcase
    end
  end
  words.join(' ')
end

# Test cases
p capitalize("hello apple world") # "Hello apple world"
puts capitalize("this is an umbrella") # "This Is An umbrella"
puts capitalize("every vowel starts an echo") # "every vowel Starts An echo"
puts capitalize("under the oak tree") # "under The oak tree"
puts capitalize("a quick brown fox") # "a quick brown fox
=end

#========================================================================
=begin
# 6 - Find_fibbonacci_slices
1:55


# Implement function that finds all fibonacci slices in a given array of integers. 
A Fibonacci slice is a sequence where every number after the first two is the 
sum of the two preceding ones. The minimum length is 3.
P
Input: array of ints 
Output: nested array

Rules:
- find fibbonacci slices

E
[2, 4, 7, 11, 18] -> [2, 4, 7] = 2 + 4
[2, 4, 7, 11] -> 0 + 1 = 2, 1 + 2 = 3 0.upto(array.size - 3) # first element

D
begin: array
  middle: subarrays
end: nested array of selected subs

A
- FIND all subarrays with length 3 and more
  - nested iteration with start and length
- SELECT AND CHECK those that give every time sum of previous two nums
  - iterate over all subarrays
  - every sub check from the third num and till the end if previous two give the sum which is the third
- return them in a new array

def is_fibonacci_slice?(sub)
  0.upto(sub.size - 3) do |first|
    if sub[first] + sub[first + 1] != sub[first + 2]
      return false
    end
  end
  true
end

p is_fibonacci_slice?([2, 4, 7, 11])

def find_fibonacci_slices(array)
  subs = []
  max_range = array.size
  array.size.times do |start|
    3.upto(max_range) do |length|
      subs << array[start, length]
    end
    max_range -= 1
  end

  subs.select do |sub| # [4, 7, 11]
    is_fibonacci_slice?(sub)
  end
end

# Test cases
puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]).inspect # [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
puts find_fibonacci_slices([2, 4, 7, 11, 18]).inspect # [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]).inspect # [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]).inspect # [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
puts find_fibonacci_slices([10, 22, 33, 43, 56]).inspect # []
=end

#========================================================================
=begin
# 7 - Find triangle pairs
12:00
Given 2 arguments of an array of numbers and a number, find 
all the pairs that results in the forming a triangle with the number.
Note: To determine if three numbers form a triangle you have to 
use the Triangle Inequality Theorem, which states that the sum of 
two side lengths of a triangle is always greater than the third side. 
If this is true for all three combinations of added side lengths, then 
you will have a triangle.

P
Input: array of nums, num
Output: nested array

Rules:
- find all pairs from array
- check if every pair in combination with second arg gives us triangle
- return selected pairs in array

E
[2, 3, 4, 5], 7 -> 
2, 3 - 7 => 2 + 3 > 7 no
2, 4 - 7 => no
2, 5 - 7 => no
3, 4 - 7 => no
3, 5 - 7 => 3+5 > 7, 5 + 7 > 3, 3 + 7 > 5
4, 5 - 7 => 4 + 5 > 7, 5 + 7 > 4, 4 + 7 > 5

D
begin: array and integer
  middle: subarrays
end: nested array

A 
- find all pairs
  - nested iteration with times and upto
- select pairs if pair with second num is a triangle
  - iterate over pairs
  - if pair.sum > second arg && (pair[0] + second arg > pair[1]) && (second)
- return array with pairs

def find_triangle_pairs(array, third)
  pairs = []
  (array.size - 1).times do |first|
    (first + 1).upto(array.size - 1) do |second|
      pairs << [array[first], array[second]]
    end
  end
  pairs.select do |pair|
    (pair.sum > third) && (pair[0] + third > pair[1]) && (third + pair[1] > pair[0])
  end
end

p find_triangle_pairs([2, 3, 4, 5], 7).inspect #  == [ [ 3, 5 ], [ 4, 5 ] ]
p find_triangle_pairs([1, 2, 3, 4], 10).inspect # ==  []
p find_triangle_pairs([7, 10, 12, 15], 9).inspect #==  [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
p find_triangle_pairs([8, 2, 5, 6, 3], 4).inspect #==  [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]
=end

#========================================================================
=begin
# 8 - Sum of nested array
10:02

Write a function that calculates the sum of all numbers in a nested array. 
The array may contain integers, nested arrays of integers, or a mix of both. 
(for ruby and JS don't use flatten)

P
Input: nested array with nums 
Output: sum of all numbers in array

Rules:
- array may contain integers and subarrays with integers, subarrays with arrays in it
- sum all numbers
- do not use flatten

E
[1, [2, 3], [4, [5, 6]]]
1   [2, 3]  [4, [5, 6]]
    2, 3    4   [5, 6]
                5, 6

D
begin: nested array
  middle: arrays
end: integer

A 
- CREATE a variable sum = 0
- OPEN array
  - add if integer to sum # sum = 1
  - if subarray, iterate subarray
- return sub

# flatten([1, [2, 3], [4, [5, 6]]])
# 1 flatten([2, 3]) flatten([4, [5, 6]])
# 1 [2, 3] [4, 5, 6]
# [1] + [2, 3] + [4, 5, 6]

# flatten([2, 3])
# [2, 3]

# flatten([4, [5, 6]])
# 4 flatten([5, 6])
# new_arr = [4] 
# [4] + [5, 6] -> [4, 5, 6]

# flatten([5, 6])
# [5, 6]

def flatten(nest_array) # [1, [2, 3], [4, [5, 6]]]
  # flatten([1]) -> [1]
  # flatten([1, [2, 3]]) -> [1, 2, 3]
  # flatten([1, [2, 3], [4, [5, 6]]]) -> [1, 2, 3, 4, 5, 6]
  new_arr = [] # [1, 2, 3, 4, 5, 6]
  nest_array.each do |element|
    if element.class == Integer
      new_arr << element
    else
      array = flatten(element) # element =>[2, 3] flattent([2, 3]) -> [2, 3] [4, 5, 6]
      new_arr = array + new_arr
    end
  end
  new_arr
end

def sum_of_nested_array(nest_array)
  total_sum = 0
  nest_array.each do |element|
    if element.class == Integer
      total_sum += element
    else
      total_sum += sum_of_nested_array(element)
    end
  end
  total_sum
end

p sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) == 21
p sum_of_nested_array([10, [20, 30, [40]], 50]) == 150

# 1 -> add
# [2, 3] -> iteration, if int add, if arr iteration sum + 2, sum + 3 => sum = 6
# [4, [5, 6]] -> if sub-iteration, if int add each integer sum + 4, iteration sum + 5 + 6

# sum(1, sum(2, 3), sum(4, sum(5, 6)))
=end

=begin
# 9 - smaller_numbers_than_current

Given an array of numbers, for each number find out how many numbers
in the array are smaller than it. When counting numbers, only count
unique values. That is, if a given number occurs multiple times in
the array, it should only be counted once.

P
Input: array of ints 
Output: array of int 

Rules:
- find how many numbers are smaller than current
- count every num only once
- return an array where every num is a number of smaller nums

E
[6,5,4,8] -> [2, 1, 0, 3]

D 
begin: array of integers
  middle: copy of array with unique values
end: arrray of counts

A
- CREATE a copy of original without duplicates
- ITERATE over original to find a count for every one of them in unique array
- select the numbers that are smaller than current and return
- return array with counts

def smaller_numbers_than_current(array)
  unique = array.uniq
  array.map do |num| # 8
    unique.select do |num2|
      num > num2
    end.size
  end
end

#Examples:
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
#The tests above should print "true".
=end

=begin
# 10 - minimum sum

Write a method that takes one argument: an array of integers.
The method should return the minimum sum of 5 consecutive
numbers in the array. If the array contains fewer than 5
elements, the method should return nil.

P
Input: array of integers
Output: minimum sum, integer

Rules: 
- return nil if array size < 5
- find all consecutive 5 numbers in array
- return the minimum sum of them

E 
[1, 2, 3, 4, 5, 6] -> 
1, 2, 3, 4, 5 = 15
2, 3, 4, 5, 6 = 25
return 15

D
begin: array of ints
  middle: subarrays
end: integers

A
- return nil if size < 5
- find all consecutive subarrays with length 5
  - (array size - length).times do |start_idx|
    subs = array[start_idx, length]
- find their sum and return the min
  - iterate over subs
  - return their sum
  - find min

def minimum_sum(array)
  return nil if array.size < 5

  subs = []
  length = 5
  0.upto(array.size - length) do |start_idx|
    subs << array[start_idx, length]
  end

  subs.min_by { |sub| sub.sum }.sum
end

# Examples:
p minimum_sum([1, 2, 3, 4]) #== nil
p minimum_sum([1, 2, 3, 4, 5, 6]) #== 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
=end

=begin
# 11 - longestConsecutiveAscendingWords
12.29

P
Input: string sentence
Output: array of words

Write a function called longestConsecutiveAscendingWords that 
takes a sentence as input and finds all consecutive word where the succeeding 
word is longer than the previous. The function should return an array of 
these pairs. Punctuation marks should be considered part of a word 
(e.g., "hello," and "hello" are different words). 

[]'a', 'abc', 'ab'].sort_by { |string| string.size }
[5, 3] == [5, 3].sort #false

Rules:
- find all consecutive words from the beginning of sentence
- punctuation is considered as a part of word
- return first ascending sequence

E
"The quick brown fox jumps over the lazy dog" -> 3 5 5 3 5 4 3 4 3 = 3 5
3 5
3 5 5
3 5 5 3
3 5 5 3 5
3 5 5 3 5 4
....
55
553

D
begin: string
  middle: array of words, all subarrays
end: subarray

A
- DIVIDE by spaces
- FIND all subarrays
- SELECT subarrays in ascending order by size
  - subarrays.select do |sub|
    sub.sort_by {|word| word.size} == sub
- RETURN first one

def longest_consecutive_ascending_words(string)
  words = string.split(' ')

  subs = []
  max = words.size
  words.size.times do |start|
    2.upto(max) do |length|
      subs << words[start, length]
    end
    max -= 1
  end

  selected = subs.select do |sub|
    sizes = sub.map do |word|
      word.size
    end # 3, 5, 5
    sub.size == sizes.uniq.size
  end

  result = selected.select do |sub|
    sub.sort_by {|word| word.size} == sub
  end
  
  if result.empty?
    [words[0]]
  else
    result[0]
  end
end

# Test cases
puts longest_consecutive_ascending_words("The quick brown fox jumps over the lazy dog").inspect # [ 'The', 'quick' ]
puts longest_consecutive_ascending_words("A journey of a thousand miles begins with a single step").inspect # [ 'A', 'journey' ]
puts longest_consecutive_ascending_words("Easy come easy go").inspect # [ 'Easy' ]
puts longest_consecutive_ascending_words("Tiny bird flew over the peaceful countryside").inspect # [ 'the', 'peaceful', 'countryside' ]
=end

=begin
# 12 - find_valid_substrings
1.00

Write a function that finds all substrings that doesn’t contain any of the 
prohibited characters given in the second argument.

P
Input: string, prohibitted string
Output: array of selected substrings

Rules:
- find all subs
- return the subs that does not contain any of the prohibitted chars

E
"hello", "el"
'h' +
'he'  -
'hel' -
'hell' -
'hello' -

e -
el -
ell -
ello -

l -
ll -
llo -

l -
lo -

o +

D
begin: string
  middle: array of subarrays
end: array of selected subarrays

A
- find all subarrays
- convert prohibitted string into array
- iterate over subs ello # select
- iterate over prohibitted chars # e, l prohibitted.any? | char| string.include?(char)
  if false
    do not select
=end

def find_valid_substrings(sentence, pro_chars)
  subs = []
  max = sentence.size
  
  sentence.size.times do |start_idx|
    1.upto






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