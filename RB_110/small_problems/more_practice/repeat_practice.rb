# Problem 1
=begin
P
Input: array of numbers
Output: array with nums that smaller than each num

Rules:
- find for every num, how many nums in array are less than the current num
- return the num of these numbers in array
- count only unique values

E
[8, 1, 2, 2, 3] --> [3, 0, 1, 1, 2]

D
begin: input array
middle: integers and array to find new values and store
end: array

A
- TRANSFORM every num in input array to the num of nums that are less than current
  - create a nested array, the outer loop is #map
  - inner loop is #select
- FIND number of elements that smaller than current for every num
  - create a copy of input array with unique values and assign to variable
  - iterate over original array with map
  - select the values that are less than current in copy array and return the size of select array for every num
- RETURN array

# C
def smaller_numbers_than_current(array)
  copy = array.uniq

  array.map do |int| # 8
    copy.select do |num|
      num < int
    end.size
  end
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result
=end

# Practice Problem 2
=begin
P
Input: array of integers
Output: integer, minimum sum of 5 consecutive numbers

Rules:
- find all sums of 5 consecutive numbers in array
- return the smallest one
- return nil if there are fewer than 5 numbers

E
[55, 2, 6, 5, 1, 2, 9, 3, 5, 100] --> 55 + 2 + 6 + 5 + 1 = 69
2 + 6 + 5 + 1 + 2 = 16
6 + 5 + 1 + 2 + 9 = 23
5 + 1 + 2 + 9 + 3 = 20
1 + 2 + 9 + 3 + 5 = 20
2 + 9 + 3 + 5 + 100 = 119

output: 16

D
begin: array of integers
middle: array to hold the sums, integers to make sums
end: integer

A
- FIND all consecutive 5 nums sum
  - iterate over array
  - start index is 0 and increments by 1 --> 0, 1, 2..
  - length is always 5
  - slice by start and length
  - break when start is greater than (array size - length)
- ADD all sums to one array
- RETURN the minimum

def minimum_sum(array)
  return nil if array.size < 5

  sums = []
  length = 5
  start = 0

  loop do 
    sums << array[start, length].sum
    start += 1
    break if start > (array.size - length)
  end

  sums.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
=end

# Problem 3
=begin
P
Input: string
Output: string 

Rules:
- take a string and modify it
- every third word's every second letter should be uppercased
- all other characters should remain the same
- if in a word not enough letters, remain the same

E
'It is a long established fact that a reader will be distracted'
a --> not enough letters --> a
fact --> fAcT
reader --> rEaDeR
distracted --> dIsTrAcTeD

D
begin: string sentence
middle: array to contain words
end: string

A
- DIVIDE string by words
  - split by spaces and store in array
- FIND every third word --> index 2, 5, 8, 11
  - create counter and assign to 1
  - loop over array with map
  - if counter % 3 == 0, then iterate over this word
- UPPERCASE every second letter --> index 1, 3, 5...
  - assign by index every odd numbered char to uppercased
- RETURN new array

# C
def to_weird_case(string)
  words = string.split(' ')
  counter = 0
  words.map do |word|
    counter += 1
    if counter % 3 == 0
      word.size.times do |idx|
        if idx.odd?
          word[idx] = word[idx].upcase
        end
      end
      word
    else
      word
    end
  end.join(' ')
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
P
Input: array of integers
Output: two integers in array

Rules:
- find the difference between all pair numbers
- return the pair with the smallest difference
- if there are several same difference
- return the first pair

E
[12, 22, 7, 17]
12, 22 --> 0, 1 = - 10
12, 7 --> 0, 2 = 5
12, 17 --> 0, 3 = 5

22, 7 --> 1, 2 = 15
22, 17 --> 1, 3 = 5

7, 17 --> 2, 3 = -10

D
begin: array of integers
middle: integers, hash to hold the pairs and their values
end: array

A
- FIND all possible pairs
  - create an empty array to add all pairs
  - iterate array size times, block parameter is the first num in pair
  - iterate inside with first num and add other nums in array to make a pair
    - first num index + 1 up to array size - 1
- FIND their difference and store the pairs as keys and difference as value
  - create a hash to store
  - iterate over array with pairs
  - every subarray subtract 0 idx from 1 idx, make them all positive
  - add all pairs as keys and their positive difference as value
- RETURN the key with the first smallest value
  - find the minimum value
  - find the key of minimum value
  - return the key

def closest_numbers(array)
  pairs = []
  (array.size - 1).times do |first|
    (first + 1).upto(array.size - 1) do |last|
      pairs << [array[first], array[last]]
    end
  end

  hash = {}
  pairs.each do |pair|
    hash[pair] = (pair[0] - pair[1]).abs
  end

  hash.key(hash.values.min)
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]
=end

# Problem 5
=begin
P
Input: string
Output: string char in downcase

Rules:
- take a string and return the character that occurs most
- if there are multiple chars with the same biggest appearence, return the first one
- ignore cases

E
'Mississippi' --> i = 4 and s = 4, but is first

D
begin: string
middle: hash to have a count as value and char as key
end: char string

A
- FIND the count of every char
  - create a hash
  - if hash has key with this char add +1 to it's value
  - else create a hash with this char and assign value to one
- RETURN the key
  - return the key with the first max value

def most_common_char(string)
  hash = {}
  string.downcase.each_char do |char|
    if hash.has_key?(char)
      hash[char] += 1
    else
      hash[char] = 1
    end
  end

  hash.key(hash.values.max)
end

p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'
=end

# Problem 6
=begin
P
Input: string
Output: hash

Rules:
- count the occurence of every LOWERCASE char
- create a hash and store chars as keys and count as value
- do not count not alphabetical chars like spaces and other
- if empty string, return empty hash

E
'W. E. B. Du Bois' --> {'u'=>1, 'o'=>1, 'i'=>1, 's'=>1}

D
begin: string input
middle: hash to hold letters and count, array of lowercase letters
end: hash

A
- FIND count of every lowercase letter's occurence
  - create an empty hash
  - create an array of lowercase letters
  - iterate over string's characters
  - if char is in the lowercase letters array
    - add this char as a key and assign value to 1
    - if hash already has this key, add 1 to it's value
- RETURN hash

# C
def count_letters(string)
  hash = {}
  letters = ('a'..'z').to_a 
  string.each_char do |char|
    if letters.include?(char)
      if hash.has_key?(char)
        hash[char] += 1
      else
        hash[char] = 1
      end
    end
  end
  hash
end

expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}
=end

# Problem 7
=begin
P
Input: array of integers
Output: integer, number of identical pairs

Rules:
- if array is empty or contains only 1 element, return 0
- if one num occurs more than twice, count each complete pair, as 8,8,8 will be only 1 pair
- return the num of pairs

E
[2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4] --> 2 occurs 3 times -> 1 pair
7 occurs 1 time
1 occurs 2 time -> 1 pair
8 occurs 4 times -> 2 pairs
4 occurs 1 time

output: 4

D
begin: array
middle: array to contain occurences
end: integer, sum of pairs

A
- FIND the count of occurences of every num and store in array
  - create an empty array
  - iterate over array input copy with unique values
  - count every unique integer's occurence in original array
  - store every count of every unique value to empty array
- FIND pairs by every occurences count, and sum it
  - iterate over array and transform every element
  - divide every num by 2
  - sum the result
- RETURN the sum

def pairs(array)
  unique_nums = array.uniq
  counts = unique_nums.map do |num|
    array.count(num)
  end

  sum = counts.map do |num|
    num / 2
  end.sum
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3
=end

# Problem 8
=begin
P
Input: string
Output: integer, the length of the longest vowel

Rules:
- find all vowel substrings
- return the longest
- string will always contain lowercase characters

E
'miaoued' --> iaoue = 5
'beauteous' --> eau = 3 eou = 3, the longest = 3

D
begin: string input
middle: string with vowels, array to store all vowel subs
end: integer, the size of the longest

A
- return 0 if empty or 1
- FIND all vowel subs in a string
  - create a string with vowel letters
  - create an empty array
  - create a variable empty string
  - iterate over input string
    - if char is a vowel, add to variable
    - else add variable's value to the array
- TRANSFORM the subs to their length
  - iterate over array
  - find their length and transform elements to integers
- RETURN the max
  - find the max number in array

# C
def longest_vowel_substring(string)
  return 0 if string.size <= 1

  vowels = 'aioue'
  vowel_subs = []
  temp = ''
  string.each_char do |char|
    if vowels.include?(char)
      temp << char
    else
      vowel_subs << temp
      temp = ''
    end
  end

  vowel_subs << temp
  vowel_subs.map do |sub|
    sub.length
  end.max
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5
=end

# Problem 9
=begin
P
Input: two strings
Output: integer

Rules:
- find if second string occurs in a first
- if yes, how many times
- return that num
- do not overlap second string in a first when counting

E
'babab', 'bab' --> bab occurs one time
ab -> is what last after first

D
begin: strings
middle: string
end: integer

A
- FIND if second word is in the first
  - iterate over first string
  - if char is equal to second string char
    - slice from the first string the sub by second's length
    - if they are equal, add 1 to counter
    - start iteration from first letter after sliced part
- RETURN the num of occurences
  - return counter

# C
def count_substrings(str1, str2)
  return 0 if str1 == ''

  counter = 0
  idx = 0
  loop do
    if str1[idx] == str2[0]
      sliced = str1[idx, str2.length]
      if sliced == str2
        counter += 1
        idx += str2.size
      else
        idx += 1
      end
    else
      idx += 1
    end
    break if idx > (str1.size - str2.size)
  end
  counter
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

# Problem 10
=begin
P
Input: string of digits
Output: number of even substring digits

Rules:
- find all substrings
- select only even subs
- if sub is repeated, count it every time

E
'1432' --> '14', '1432', '4', '432', '32', and '2' = 6

D
begin: string
middle: array to hold substrings
end: integer

A
- FIND all subs
  - create a nested loops to find start and length
- SELECT only even subs
  - iterate over array of subs and select only evens
- RETURN the size of selected array
  - find the size of selected array and return

# C
def even_substrings(string)
  subs = []
  max_range = string.size
  string.size.times do |start|
    1.upto(max_range) do |length|
      subs << string[start, length]
    end
    max_range -= 1
  end

  subs.select do |sub|
    sub.to_i.even?
  end.size
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12
=end

# Problem 11
=begin
P
Input: nonempty string
Output: array of string and integer

Rules:
- string input is s
- output array [string is t, integer is k
- s == t * k
- the values of t and k are the shortest of possible
- input consists from only lowercase letters

E
'xyzxyzxyz' --> 'xyz' * 3

D
begin: string
middle: string
end: array

A
- FIND a shortest substring
  - iterate over string
  - create a variable and assign to empty string
  - start iteration from 1 letter and increment by 1
- DIVIDE string size by this substring size
  - if substtring is multiplied by num of division result is equal to input, return sub
- RETURN in array substring and integer
  - return sub and integer

# C
def repeated_substring(string)
  substring = ''
  integer = 0
  string.each_char do |char|
    substring << char
    integer = string.size / substring.size
    if (substring * integer) == string
      break
    end
  end

  [substring, integer]
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]
=end

# Problem 12
=begin
P
Input: string
Output: boolean

Rules:
- pangrams are the sentences that contain all letters of alphabet at least once
- return true if sentence is a pangram
- return false if not
- ignore cases

E
my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true

D
begin: string
middle: array with lowercase alphabetical letters
end: boolean

A
- CREATE an array of letters
  - convert range of letters to array
- RETURN true if string's every letter included to array of letters
  - iterate over array
  - if all letters from array is included to string
  - return true, false otherwise

# C
def is_pangram(string)
  alphabet = ('a'..'z').to_a
  alphabet.all? { |letter| string.downcase.include?(letter) }
end

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true
=end

# Problem 13
=begin
P
Input: two strings
Output: boolean

Rules:
- find if second string's all letters are in the first string
- return true if all of them could be found in the first string

E
'boldface', 'coal' --> o, l, a, c -> true

D
begin: strings
middle: hash to count all letters and their counts
end: boolean

A
- CONVERT first string to hash
- CONVERT second to hash
- COMPARE the keys and their values
- RETURN true if there is a key as a char in first hash, but it's value is equal or more in first

# C
def unscramble(str1, str2)
  hash1 = {}
  str1.each_char do |char|
    if hash1.has_key?(char) 
      hash1[char] += 1
    else
      hash1[char] = 1
    end
  end

  hash2 = {}
  str2.each_char do |char|
    if hash2.has_key?(char) 
      hash2[char] += 1
    else
      hash2[char] = 1
    end
  end

  hash2.each do |k, v|
    if hash1.has_key?(k)
      hash1[k] >= v
    else
      return false
    end
  end
  true
end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true
=end

# Problem 14
=begin
P
Input: integer
Output: integer, sum of all nums that are less than arg

Rules:
- check all nums from 1 that are less than arg integer
- if num is divisible by 7 or 11, add this num to result num
- if num divisible by 11 and 7, count this num just once
- if the arg is neg return 0
- the arg number is exluded

E
11 -> 7 
12 -> 7 + 11 = 18

D
begin: integer input
middle: array of nums from 1 till arg
end: integer, that represents the sum

A
- FIND all nums that are less than argument
  - create a range of nums from 1...arg
  - convert it to array
- SELECT only divisible by 7 or 11 without a remainder
  - iterate over array
  - check if every num is divisible by 7 or eleven without a remainder
- RETURN the sum of multipliers
  - sum selected numbers

# C
def seven_eleven(integer)
  return 0 if integer < 0

  range = (1...integer).to_a
  seven_mult = range.select do |num|
    num % 7 == 0
  end

  eleven_mult = range.select do |num|
    num % 11 == 0
  end

  (seven_mult + eleven_mult).uniq.sum
end

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0
=end

# Problem 15
=begin
P
Input: string
Output: integer, the greatest product of 4 nums

Rules:
- take a string from digits
- find all possible 4 consecutive numbers
- find their products and return the biggest
- input always will be the 4 or more element array

E
'123987654'
1*2*3*9 = 54
2*3*9*8 = 432
3*9*8*7 = 1512
9*8*7*6 = 3024
8*7*6*5 = 1680
7*6*5*4 = 840

output: 3024

D
begin: string 
middle: array to hold the products or variable
end: greatest num

A
- FIND all possible 4 consecutive nums: first num 0, 1, 2, 3, 4..., LENGTH IS 4
  - iterate over array, string size times, block parameter is start
  - the length always is 4
  - slice the string by start and length
  - iterate over sliced part to convert to array of chars
  - transform them into integers
  - find the product of every sliced part
  - add all products to new array
  - break if start > array size - length
- FIND THE MAXIMUM num and return

# C
def greatest_product(string)
  length = 4
  products = []
  string.size.times do |start|
    break if start > (string.size - length)
    products << string[start, length].chars.map {|num| num.to_i }.inject(:*)
  end
  products.max
end
    
p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6
=end

# Problem 16
=begin
P
Input: string from letters and digits
Output: integer, num of chars that occur more than once

Rules:
- input string contain only alphanumeric chars
- count num of characters that occur more than once
- ignore cases

E
'xXyYpzZr' --> x, y, z = 3

D
begin: string
middle: array to store uniq chars
end: integer

A
- CREATE a downcased unique array copy of string chars
  - create a variable and assign to unique values array
  - downcase the original and copy
- FIND THE COUNT of every char
  - iterate over unique values and find their count in original array
- COUNT the num of chars that occur more than 1 time
  - create a variable and assign to 0
  - if count is more than 1
  - increment a variable by 1
  - return this variable after iteration

# C
def distinct_multiples(string)
  copy = string.downcase.chars.uniq
  counter = 0
  copy.each do |char|
    char_count = string.downcase.count(char)
    if char_count > 1
      counter += 1
    end
  end

  counter
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

# Problem 17
=begin
P
Input: array of integers
Output: integer, difference between array sum and closest prime num

Rules:
- array will always contain 2 or more int
- all values are positive
- may be multiple occurences of the various numbers in the array

E
[5, 2] --> 5 + 2 = 7 -> 7 is prime but we do not count the sum itself, thus closest after
seven is 11.
output is 4

D
begin: array of integers
middle: integers to find the next prime
end: integer, difference

A
- FIND the sum of the input array
  - use #sum
- INCREMENT this num by 1
  - assign variable next prime to sum
  - start loop
  - add 1 to next prime, check if it's prime
  - if yes, break the loop
  - else, go to the next num
- CHECK every incremented num if it is a prime num
  - take a num and find it's square root
  - find nums that are less than square root
  - if input num is divisible by one of this nums it is not a prime, return false
  - if not divisible it is a prime, return true
- RETURN the result of this num minus sum
  - if num is prime
  - prime num - sum = difference

def is_prime?(integer)
  root = Math.sqrt(integer)
  range = (2..root)
  range.none? { |num| integer % num == 0 }
end

def nearest_prime_sum(arr)
  sum_of_arr = arr.sum
  next_prime = sum_of_arr
  result = 0
  loop do
    next_prime += 1
    if is_prime?(next_prime)
      result = next_prime - sum_of_arr
      break
    end
  end
  result
end

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4
=end

# Problem 18
=begin
P
Input: array of integers
Output: integer, index

Rules:
- find the sum of left side and right side numbers of each element in array
- if both sides sums are equal, return that element's index
- if multiple answers, return the smallest index
- if there are no equal sums for this array, return -1

E
[7, 99, 51, -48, 0, 4] -> 1

D
begin: array of nums
middle: subarrays to hold the nums from left and right
end: index

A
- FIND all left and right subarrays of every element exclusively
  - iterate over array indices
  - slice the left side nums from 0 to current num exclusively
  - sum them
  - slice nums from right from current +1 till the end
  - find the sum
  - compare two sides
  - return the current index if they are equal
  - -1 otherwise

# C
def equal_sum_index(array)
  array.size.times do |idx|
    left = array.slice(0...idx)
    right = array.slice(idx + 1..-1)
    if left.sum == right.sum
      return idx
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

# Problem 19
=begin
P
Input: array of integers
Output: integer from element

Rules:
- find the appearance of every num in array
- return the num with odd appearance
- there will be always one num with such condition

E
[7, 99, 7, 51, 99, 7, 51] --> 7 = 3, 99 = 2, 51 = 2
output: 7

D
begin: array of integers
middle: hash to hold the count and integer from array
end: integer

A
- CREATE a copy of array with unique values
  - initialize a variable with copy of unique values
- FIND count of every unique value in original array and store in a hash
  - iterate over unique values and find their count in input
  - create a hash and store the unique values as keys and their count as values
- RETURN the key with odd value
  - iterate over hash values and return the key if value is odd

# C
def odd_fellow(array)
  copy = array.uniq
  hash = {}
  copy.each do |num|
    hash[num] = array.count(num)
  end

  hash.each do |k, v|
    if v.odd?
      return k
    end
  end
end

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0
=end

# Problem 20
=begin
P
Input: array of nums
Output: number from array

Rules:
- find the different from other nums number in array
- return this num
- the array will always contain at least 3 numbers
- only 1 num will be different from others

E
[7, 7, 7, 7.7, 7] --> 7.7

D
begin: array
middle: array of nums
end: num

A
- FIND if first num in array is equal to the second num
  - if they are equal: iterate over array and find the num that is not equal to the first
  - if they are not equal: compare first with third num and second with third
    - return the first if it is not equal to the third
    - return second if it is not equal to the third

# C
def what_is_different(array)
  if array[0] == array[1]
    array.each { |num| return num if num != array[0] }
  else
    if array[0] != array[2]
      return array[0]
    elsif array[1] != array[2]
      return array[1]
    end
  end
  
end

p what_is_different([0, 1, 0]) #== 1
p what_is_different([7, 7, 7, 7.7, 7]) #== 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) #== 11
p what_is_different([3, 4, 4, 4]) #== 3
p what_is_different([4, 4, 4, 3]) #== 3
=end
    

# Problem 9
=begin
P
Input: two strings
Output: integer, count of second string occurence in first

Rules:
- find how many times second string occurs in first
- do not everlap when count
- second arg is never empty
- if first empty return 0

E
'babab', 'bab' --> 'bab'

D
begin: strings as input
middle: string to find substrings
end: integer, count

A
- FIND all consecutive substrings with length of the second input string
  - iterate the first string
  - find start and length to slice
  - start from 0 and increment by 1 till start will be more than first string size - second string size
  - length is equal to second string size
- CHECK every substring if equal to second
  - by every iteration, check every sliced sub if equal to the second
  - if equal, start += second string size
  - if not, start += 1
- return times when sub was equal to second
  - create a variable before loop
  - increment by 1 if sliced sub is equal

# C
def count_substrings(str1, str2)
  counter = 0
  start = 0
  length = str2.size
  loop do
    if str1[start, length] == str2
      counter += 1
      start += length
    else
      start += 1
    end
    break if start > (str1.size - str2.size)
  end
  counter
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

# Problem 17
=begin
P
Input: array of integers
Output: integer, difference

Rules:
- find the sum of array integers
- find the nearest prime num after sum, do not include the sum
- find the difference between nearest prime and sum, and return
- the array will always contain at least two nums
=end
def is_prime?(next_num)
  root = Math.sqrt(next_num)
  range = (2..root).to_a
  range.none? { |num| next_num % num == 0 }
end

def nearest_prime_sum(array)
  sum = array.sum
  next_num = sum
  result = 0
  loop do 
    next_num += 1
    if is_prime?(next_num)
      return result = next_num - sum
    end
  end
end

p nearest_prime_sum([1, 2, 3]) #== 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4
