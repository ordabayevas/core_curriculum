# Problem 1
=begin
Create a method that takes an array of numbers as an argument.
For each number, determine how many numbers in the array are smaller than it, 
and place the answer in an array. Return the resulting array.

When counting numbers, only count unique values. That is, if a number 
occurs multiple times in the array, it should only be counted once.

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result

def smaller_numbers_than_current(array)
  unique_nums = array.uniq
  array.map do |num|
    unique_nums.select { |uni| uni < num }.size
  end
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]

p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
=end

# Problem 2
=begin
def minimum_sum(array)
  return nil if array.size < 5

  arr_sums = []
  (array.size - 4).times do |idx|
    arr_sums << array[idx, 5].sum
  end
  arr_sums.min
end

p minimum_sum([1, 2, 3, 4, 5, -5])
=end

# Problem 3
=begin
Create a method that takes a string argument and returns a copy of the string with 
every second character in every third word converted to uppercase. 
Other characters should remain the same.

P
Input: string
Output: modified string

Rules:
- take string and divide by words
- return every third string with second letter uppercased
- other letters should be the same case
- if there is less chars in the word, return just a word

E
'It is a long established fact that a reader will be distracted' -->
'a' --> doesn't have enough letters
'fact' --> fAct
'reader' --> rEader
'distracted' --> 'dIstracted'

D
begin: string
middle: array
end: string

A
- FIND every third word
- MODIFY every second letter's case
- CONVERT array to string

C
def to_weird_case(string)
  arr_of_words = string.split(' ')
  idx = 0
  str = arr_of_words.map do |word|
    idx += 1
    if idx == 3
      word.each_char.with_index do |char, i|
        (word[i] = word[i].upcase) if i.odd?
      end
      idx = 0
      word
    else
      word
    end
  end
  str.join(' ')
end

original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected
=end

# Problem 4
=begin
Create a method that takes an array of integers as an argument and returns 
an array of two numbers that are closest together in value. If there are 
multiple pairs that are equally close, return the pair that occurs first in the array.

P
Input: array of integers
Output: array of two nums

Rules:
- find two numbers that have the minimum difference in between
- if there are many pairs of nums like this, return the first one

E
[5, 25, 15, 11, 20] == [15, 11] ---> 
5 - 25 = -20, 5 - 15 = -10, 5 - 11 = -6, 5 - 20 = -15, 
25 - 15 = 10, 25 - 11 = 14, 25 - 20 = 5, 
15 - 11 = 4, 15 - 20 = -5,
11 - 20 = 9

[20, 10, 6, 15, 10, 14, 5, 4, 5, 9] - difference

D
begin: array
middle: integers
end: array

A
- FIND all nums difference
  - iterate over array - create nested array.size times
  - inside create a loop that creates a hash with difference as a key and two nums array as value
  - iterate from array size - (i+1)
- FIND the first smallest difference in between pair of nums
  - compare keys
- RETURN in the array
  - return value of the smallest difference

# C
def closest_numbers(array)
  hash = {}
  (array.size - 1).times do |i|
    (i + 1).upto(array.size-1) do |j|
      difference = (array[i] - array[j]).abs
      hash[[array[i], array[j]]] = difference
    end
  end

  result = nil
  diff = hash.values[0]
  hash.each do |k, v| 
    if v < diff
      diff = v
      result = k
    end
  end
  result
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

# i, j
# 0, 1
# 0, 2
# 0, 3
# 0, 4
# 1, 2
# 1, 3
# 1, 4
# 2, 3
# 2, 4
# 3, 4
=end

# Practice Problem 5
=begin
Create a method that takes a string argument and returns the character 
that occurs most often in the string. If there are multiple characters 
with the same greatest frequency, return the one that appears first in the string. 
When counting characters, consider uppercase and lowercase versions to be the same.

P
Input: string
Output: string character

Rules:
- count the occurences of every character
- return the character with most often occurence
- if there are multiple greater occurences, return the first one
- ignore cases

E
'Mississippi' --> 'i', because stands first
'Happy birthday!' --> 'h'

D
begin: string
middle: hash
end: string

A
- COUNT all letters occurences in a string
  - iterate over chars
- CREATE a hash
  - add letters as key, and count as value
- RETURN the first one with the greatest occurences
  - assign temp variable and retrun the first greatest

# C
def most_common_char(string)
  hsh = {}
  new_str = ''
  string.downcase.each_char do |char|
    if ('a'..'z').to_a.include?(char)
      new_str <<  char
    end
  end

  new_str.each_char do |char|
    if hsh.has_key?(char)
      hsh[char] += 1
    else
      hsh[char] = 1
    end
  end

  first_greatest = hsh.keys[0]
  count = hsh.values[0]
  hsh.each do |k, v|
    if v > count
      count = v
      first_greatest = k 
    end
  end
  first_greatest
end

p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'
p most_common_char('Hello World') == 'l'
=end

# Practice Problem 6
=begin
Create a method that takes a string argument and returns a hash in which 
the keys represent the lowercase letters in the string, and the values 
represent how often the corresponding letter occurs in the string.

P
Input: string
Output: hash

Rules:
- return the hash with keys of lowercase letters from input
- values are their count in a string
- if empty string, empty hash
- if non alphabetical char, return empty hash
- do not count the uppercase letters

E
'W. E. B. Du Bois' --> {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}

D
begin: string
middle: string
end: hash

A
- SELECT lowercase letters
  - iterate over string
  - select only lowercase alphabetical characters
- COUNT their occurences in a string
  - if char is met more than once, add +1 every time
- CREATE a hash with chars as keys and count as values
  - initialize the new hash
=end

# C
# def count_letters(string)
#   lowercase_arr = string.chars.select do |char|
#     ('a'..'z').to_a.include?(char)
#   end

#   hash = {}
#   lowercase_arr.each do |char|
#     if hash.has_key?(char)
#       hash[char] += 1
#     else
#       hash[char] = 1
#     end
#   end
#   hash
# end

# expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
# p count_letters('woebegone') == expected

# expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
#             'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
# p count_letters('lowercase/uppercase') == expected

# expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
# p count_letters('W. E. B. Du Bois') == expected

# p count_letters('x') == {'x' => 1}
# p count_letters('') == {}
# p count_letters('!!!') == {}

# Practice Problem 7
=begin
Create a method that takes an array of integers as an argument and returns 
the number of identical pairs of integers in that array. For instance, 
the number of identical pairs in [1, 2, 3, 2, 1] is 2: there are two 
occurrences each of both 2 and 1.

If the array is empty or contains exactly one value, return 0.

If a certain number occurs more than twice, count each complete pair once. 
For instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2. 
The first array contains two complete pairs while the second has an extra 2 that 
isn't part of the other two pairs.

P
Input: array of integers
Output: integer, num of pairs

Rules:
- count the identical number pairs
- if array is empty or has a size if 1, return 0

E
pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3 --> pair of 3, pair of 5, pair of 9

D
begin: array
middle: hash
end: integer

A
- COUNT all nums
  - create a hash with num as key, and it's count as a value
- DIVIDE all nums count by 2
  - iterate over values and divide by two
- SUM all counts
  - sum all values

# C
def pairs(array)
  hash = {}
  array.each do |num|
    if hash.has_key?(num)
      hash[num] += 1
    else
      hash[num] = 1
    end
  end

  values = hash.values.map do |value|
    value / 2
  end

  values.sum
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3
=end

# Practice Problem 8
=begin
Create a method that takes a non-empty string as an argument. 
The string consists entirely of lowercase alphabetic characters. 
The method should return the length of the longest vowel substring. 
The vowels of interest are "a", "e", "i", "o", and "u".

P
Input: non-empty string
Output: integer, length of the longest vowel sub

Rules:
- count all vowel substrings
- return the num of the longest sub size
- the input is never empty
- the input always is lowercase

E
'beauteous' --> eau, eou == 3
'miaoued' --> iaoue == 5

D
begin: string
middle: array of string
end: integer

A
- FIND all vowel substrings
  - create a temp variable and assign to empty string
  - iterate over string
  - if char is a vowel, add to temp
- ADD them all in array
  - create an empty array
  - if char is a consonant, add temp to array
  - add the last temp value after iteration
- FIND the size of the vowel substrings
  - iterate over array of vowel subs
  - return the array of sizes
- RETURN the max size
  - find the max integer in array

# C
def longest_vowel_substring(string)
  vowels = 'aieou'

  array = []
  temp = ''
  string.each_char do |char|
    if vowels.include?(char)
      temp << char
    else
      array << temp
      temp = ''
    end
  end
  array << temp

  sub_sizes = array.map { |sub| sub.size }
  sub_sizes.max
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5
=end

# Practice Problem 9
=begin
Create a method that takes two string arguments and returns the number 
of times that the second string occurs in the first string. Note that 
overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.
You may assume that the second argument is never an empty string.

P
Input: 2 strings
Output: integer, number of occurences

Rules:
- count how many times second input occur is in the first input
- return integer times
- do not count overlapping

E
'bbbaabbbbaab', 'baab' --> 2 times

D
begin: string inputs
middle: array for counting objects
end: integer times

A
- FIND subs with length of second input
  - start a loop
  - find substring with length of second input
    - if substring is equal to the second string, continue looping after first substring
    - if not equal, start iteration from the next letter
    - break if start is greater than size1 - size2, stop when there is no enough letters for string2
- COUNT how many times second input is occur in 1 string
  - initialize the variable cont and assign to 0
  - increment by 1 if sub matched to string2

# C
def count_substrings(str1, str2)
  substrings = []
  count = 0
  start = 0
  loop do
    break if start > (str1.size - str2.size)
    if str1[start, str2.size] == str2
      count += 1
      start += str2.size
    else
      start += 1
    end
  end
  
  count
end

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1
=end

# Practice Problem 10
=begin
Create a method that takes a string of digits as an argument and 
returns the number of even-numbered substrings that can be formed. 
For example, in the case of '1432', the even-numbered substrings are 
'14', '1432', '4', '432', '32', and '2', for a total of 6 substrings.

Input: string digits
Output: integer, num of subs

Rules:
- find substrings that form even numbers
- return the num of even numbers

E
'1432' --> 1, 14, 143, 1432, 4, 43, 432, 3, 32, 2 == 6 even numbers

D
begin: string input
middle: integer to check if it's even num, array to hold all subs
end: integer to return the num of even nums

A
- FIND all substrings
  - create nested loop to find all substrings
- COUNT even numbers
  - count += 1 if substring is even num
- RETURN the even numbers num
  - return the count

# C
def even_substrings(string)
  count = 0
  max_range = string.size
  string.size.times do |start|
    1.upto(max_range) do |length|
      count += 1 if string[start, length].to_i.even?
    end

    max_range -= 1
  end
  
  count
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12
=end

# Practice Problem 11
=begin
Create a method that takes a nonempty string as an argument and returns an 
array consisting of a string and an integer. If we call the string argument s, 
the string component of the returned array t, and the integer component of the 
returned array k, then s, t, and k must be related to each other such that s == t * k. 
The values of t and k should be the shortest possible substring and the largest 
possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase alphabetic letters.

P
Input: string
Output: array of a string and integer

Rules:
- s = string input
- t = string component of returned array
- k = integer component of returned array
- s == t * k
- string consists from lowercase alpha letters

E
'xyzxyzxyz' --> ['xyz', 3]

D
begin: string
middle: array with substrings, integer to count times you need to multiply
end: array

A
- FIND substring that starts from the beginning till the next first letter
  - iterate over string
  - create new variable -> empty string
  - add letters to empty string while the letter is equal to the first letter
  - if no letter found, return the whole string
- DIVIDE the size of string by this substring num
  - find the length of substring
  - divide the size of string by size of substring
- CHECK if substring multiply by num is the equal to the input string
  - mulpitply the substring by num
  - if equal, return the array with sub and num

def repeated_substring(string)
  substring = string[0]
  string[1..-1].each_char do |char|
    break if char == string[0]
    substring << char
  end

  num = string.size / substring.size
  if substring * num == string
    [substring, num]
  end
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]
=end

# Practice Problem 12
=begin
Create a method that takes a string as an argument and returns true if the string 
is a pangram, false if it is not.

Pangrams are sentences that contain every letter of the alphabet at least once. 
For example, the sentence "Five quacking zephyrs jolt my wax bed." is a pangram since 
it uses every letter at least once. Note that case is irrelevant.
P
Input: string
Output: boolean

Rules:
- check if string includes all letters from alphabet at least once
- ignore the case
- return true or false

E
'The quick, brown fox jumps over the lazy dog!' --> true

D
begin: string
middle: array to contain alphabet letters
end: boolean

A
- CREATE the alphabet array
  - convert a range of a to z to array
- CHECK if all letters from array is in the string
  - iterate over array and check if they are inside the string
- RETURN true or false

# C
def is_pangram(string)
  alphabet = ('a'..'z').to_a
  alphabet.all? { |char| string.downcase.include?(char) }
end

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true
=end

# Practice Problem 13
=begin
Create a method that takes two strings as arguments and returns true if some 
portion of the characters in the first string can be rearranged to match the characters 
in the second. Otherwise, the method should return false.

You may assume that both string arguments only contain lowercase alphabetic characters. 
Neither string will be empty.
P
Input: 2 strings
Output: boolean

Rules:
- 2 non-empty strings
- return true if first string contains all letters from the second

E
'ansucchlohlo', 'launchschool'

D
begin: strings
middle: hash to count the letters
end: boolean

A
- CONVERT first string to hash with keys as char and value as count
- CHECK if second string letters are in a hash and their count is equal or less than their value in a hash
- RETURN true if all letters and counts are right

# C
def unscramble(str1, str2)
  str1_hsh = {}
  str1.each_char do |char|
    if str1_hsh.has_key?(char)
      str1_hsh[char] += 1
    else
      str1_hsh[char] = 1
    end
  end

  str2.chars.all? { |char| str1_hsh.has_key?(char) && str1_hsh[char] == str2.count(char)}
end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true
=end

# Practice Problem 14
=begin
Create a method that takes a single integer argument and returns the sum 
of all the multiples of 7 or 11 that are less than the argument. If a number is 
a multiple of both 7 and 11, count it just once.
For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 22. 
The sum of these multiples is 75.
If the argument is negative, return 0.

P
Input: integer
Output: integer, sum of multiples

Rules:
- find all multiples of 7 and 11 that are below the given integer
- if some num multiplies by 7 and 11, count it once
- if the argument is negative, return 0

E
12 -> 7, 11 = 18

D
begin: integer
middle: array to hold multiples
end: integer, that represents the sum

A
- RETURN 0 if given input is negative
- FIND all multiples of 7
- FIND all multiples of 11
- FIND the sum of multiples

# C
def seven_eleven(integer)
  multiples = []
  integer.times do |num|
    if num % 7 == 0
      multiples << num
    elsif num % 11 == 0
      multiples << num
    end
  end
  multiples.uniq.sum
end

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0
=end

# Practice Problem 15
=begin
Create a method that takes a string argument that consists entirely of numeric 
digits and computes the greatest product of four consecutive digits in the string. 
The argument will always have more than 4 digits.

P
Input: string digits
Output: integer, the greatest product

Rules:
- find a product of all four consecutive nums
- return the greatest
- the input is always more than 4

E
'3145926' --> 3 * 1 * 4 * 5 = 60
1 * 4 * 5 * 9 = 180
4 * 5 * 9 * 2 = 360
5 * 9 * 2 * 6 = 540

D
begin: string input
middle: integer to compute the product
end: integer

A
- FIND all four consecutive numbers substrings
  - iterate with loop
  - slice by start and length
  - length is 4
  - start is 0 and increments by 1 till index is -4
  - break if start > string size - length
- COMPUTE their products
  - iterate with map
  - find the product of every substring
  - convert to integer
  - use inject
- RETURN the largest
  - use max

# C
def greatest_product(str_digits)
  subs = []
  start = 0
  length = 4
  loop do
    subs << str_digits[start, length]
    start += 1
    break if start > str_digits.size - length
  end

  subs.map do |sub|
    product = 1
    sub.chars.map do |num|
      product *= num.to_i
    end
    product
  end.max
end

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6
=end

# Practice Problem 16
=begin
Create a method that returns the count of distinct case-insensitive alphabetic 
characters and numeric digits that occur more than once in the input string. 
You may assume that the input string contains only alphanumeric characters.

P
Input: string with alphanumeric characters
Output: integer count of repetitive chars

Rules:
- find chars that repeats in string more than once
- return the count of chars that repeats

E
'xxyypzzr' --> x count 2, y count 2, p count 1, z count 2, r count 1
'3141592653589793' --> 3 count 3, 1 count 2, 4 count 1, 5 count 2, 9 count 2, 2 count 1,

D
begin: string
middle: array to contain repetitive letters
end: integer

A
- CREATE a copy of string with unique characters
  - convert to array of chars
  - delete the duplicates
- FIND number of occurences of unique chars in the input string
  - iterate over new unique string
  - select chars that have count more than 1
- RETURN the size of array

def distinct_multiples(string)
  unique_chars = string.downcase.chars.uniq

  unique_chars.select do |char|
    string.downcase.count(char) > 1
  end.size
end

p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5
=end

# Practice Problem 17
=begin
Create a method that takes an array of integers as an argument. 
The method should determine the minimum integer value that can be appended to 
the array so the sum of all the elements equal the closest prime number that is 
greater than the current sum of the numbers. For example, the numbers in [1, 2, 3] 
sum to 6. The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array 
to sum to 7.

Notes:

The array will always contain at least 2 integers.
All values in the array must be positive (> 0).
There may be multiple occurrences of the various numbers in the array.

P
Input: array of integers
Output: integer, difference to the closest prime num

Rules:
- find the next prime num after sum of array
- return the difference between array sum and prime num
- all array nums are positive
- array has at least two nums
- may be multiple occurences of the various numbers

What if the sum is a prime num?

E
[2, 12, 8, 4, 6] --> the sum is 32
33 not prime
34 not prime
35 not prime
36 not prime
37 is prime

37 - 32 = 5
return value is 5

D
begin: array of integers
middle: integers to compute the nums after sum
end: integer, the difference

A
- FIND sum of all integers in array
  - use #sum to fimd the sum
- FIND the next nums after sum
  - iterate and increment by 1 the sum number
  - break if num is a prime
- FIND the next closest prime num
  - check the iteration's current num is prime or not:
    - find the square root of number
    - create an array from 2 till the square root of number inclusively
    - divide the checking number by every of this num
    - if any division divides without a remainder, the number is not a prime
- RETURN the difference between prime num and sum
  - after finding a prime num, find the difference

def is_prime?(number)
  root = Math.sqrt(number)
  nums = (2..root).to_a
  nums.any? { |n| number % n == 0 } ? false : true
end

def nearest_prime_sum(arr)
  sum = arr.sum
  next_num = sum + 1
  loop do
    break if is_prime?(next_num)
    next_num += 1
  end

  next_num - sum
end

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4
=end

# Practice Problem 18
=begin
Create a method that takes an array of integers as an argument. 
Determine and return the index N for which all numbers with an index less than 
N sum to the same value as the numbers with an index greater than N. If there is 
no index that would make this happen, return -1.
If you are given an array with multiple answers, return the index with the 
smallest value.
The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the 
numbers to the right of the last element is 0.

P
Input: array of integers
Output: the index N

Rules:
- find the index where the right nums sum is equal to left nums sum
- return the index
- if there are no equal sums return -1
- if there are multiple answers, return the first index

E
p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0

D
begin: array of integers
middle: subarrays of left and right side numbers, integers
end: integer that represents index

A
- FIND sum from the left side and right side of every element
  - iterate through every element index
  - slice nums from 0 till current element index exclusively
  - slice nums from current element index + 1 till the end of array
- COMPARE the sums and find the equal
  - find the sum of every sliced subarray
  - compare for equality left and right sides
- RETURN the index if found the equal sums
  - if left and right sides are equal, return the current index
- RETURN -1 if not found
  - if iteration is ended, return -1

def equal_sum_index(arr)
  arr.size.times do |index|
    left = arr[0...index]
    right = arr[(index + 1)..-1]
    if left.sum == right.sum
      return index
    end
  end
  -1
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0
=end

# Practice Problem 19
=begin
Create a method that takes an array of integers as an argument and returns the 
integer that appears an odd number of times. There will always be exactly one 
such integer in the input array.

P
Input: array of integers
Output: integer, odd times occurence

Rules: 
- find all nums occurences
- return the integer that occurs odd times in array
- array will always has such a num
- nums can be pos and neg

E
[25, 10, -6, 10, 25, 10, -6, 10, -6] 
--> 25 - 2 times
10 - 4 times
-6 - 3 times
return output is -6

D
begin: array of num
middle: hash to store count and elements of array
end: integer

A
- FIND all unique elements count of array
  - create a unique elements copy of array
  - itereate through this array
  - find the count of every unique value in original array
  - create a hash
  - store the element of array as key and count as value
- FIND the odd num counted integer
  - select the odd num value
- RETURN that integer
  - return the key

# C
def odd_fellow(array)
  unique = array.uniq
  hash = {}
  unique.each do |element|
    hash[element] = array.count(element)
  end
  
  hash.select { |k, v| v.odd? }.keys[0]
end

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0
=end

# Practice Problem 20
=begin
Create a method that takes an array of numbers, all of which are the same except one. 
Find and return the number in the array that differs from all the rest.
The array will always contain at least 3 numbers, and there will always be exactly 
one number that is different.

P
Input: array of integers
Output: number, different from other nums

Rules:
- take an array with nums that are the same except 1
- find the different from other nums num
- only 1 will be different
- and the length of array will be at least 3

E
[7, 7, 7, 7.7, 7] --> 7.7

D
begin: array of int
middle: integers to define same or different
end: integer

A
- FIND the different num
  - compare first two nums, if they are equal:
    - iterate over array and delete every num by first num
    - return the num that gives in a result other than 1 num
  - if first two nums are not equal, compare first to third and second to third
    - find not equal expression and return first or the second num
=end

# C
def what_is_different(array)
  if array[0] == array[1]
    array.select { |num| array[0] != num }[0] 
  elsif array[0] != array[1]
    if array[0] != array[2]
      return array[0]
    elsif array[1] != array[2]
      return array[1]
    end
  end
end

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3
