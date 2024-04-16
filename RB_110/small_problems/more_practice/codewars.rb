=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text 
is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

P
Input: 2 strings
Output: integer, count
def solution(str1, str2)
  counter = 0
  str1.size.times do |start|
    if str1[start, str2.size] == str2
      counter += 1
    end
  end
  counter
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
=end



=begin
Reverse or rotate?
The input is a string digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size ss
(ignore the last chunk if its size is less than ss).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise
rotate it to the left by one position. Put together these modified chunks and return the result as a string.

If ss is <= 0 or if str is empty return ""

if ss is greater (>) than the length of str it is impossible to take a chunk of size ss hence return "".

P 
Input: string digits and integer ss 
Output: modified string digits

Rules: 
- if string empty, if ss greater than the size of the string, ss is less than 0 or equal  to 0 return ""
- if sum of cubes of the chunk digits is divisible by 2, reverse that chunk
- if sum not divisible, rotate one element to the left
- if last chunk will be less than ss, do not add it to result string

Examples:
"66443875", 4 -> 
6644 -> 6**3 + 6**3 + 4**3 + 4**3 = 560 is divisible, 4466
3875 -> 3**3 + 8**3 + 7**3 + 5**3 = 1007 not divisible, 8753
"44668753"

D 
input: string digits
middle: convert to integer to calculate
end: convert string 

A 
- DIVIDE string by chunks
  - slice string with loop and add to Array
- FIND a sum of cubes and check it, if divisible by 2
  - transform chunks
  - if divisible: reverse the chunk and return to array
  - if not divisible: move first element of chunk to the last position
- CONVERT array of chunks to string and return

# C 
def revrot(string, ss)
  return '' if ss <= 0 || ss > string.size

  array = []
  index = 0
  loop do
    array << string[index, ss]
    index += ss
    break if index > string.size - ss
  end
  
  new_arr = array.map do |chunk| #'4466'-> '4' '4'
    cubes = chunk.chars.map do |digit|
      digit.to_i ** 3
    end

    if cubes.sum % 2 == 0
      chunk.reverse
    else 
      arr_chunk = chunk.chars
      first = arr_chunk.shift
      arr_chunk << first
      arr_chunk.join
    end
  end

  new_arr.join
end

p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("", 8) == ""
p revrot("123456779", 0) == ""

p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("563000655734469485", 4) == "0365065073456944"
=end

# Kebabize
=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.

P
Input: string in camel case
Output: string in kebab case

Rules:
- given string without spaces in camel case with alpha chars and digits
- modify to kebab case
- kebab case is every word in lowercase letters, and words separated by dash without spaces
- if input has a digits, delete them
- first letter of input is in lowercase

E
'myCamelHas3Humps' -> my - camel - has - humps

D
begin: string input
middle: array to store words
end: return string

A
- SEPARATE words without digits and store in array
  - create an array of digits
  - create an array
  - iterate over characters
    - if digit, skip it
    - add to temporary variable chars until uppercase letter
    - if uppercase letter is met, add temporary to array
    - after looping, add temporary to array again
- CONCATENATE words to each other with dash line between and return as a string
  - join the array string with dash

def kebabize(camel_string)
  digits = '0123456789'
  words = []
  temporary = ''
  camel_string.each_char do |char|
    if digits.include?(char)
      next
    elsif char == char.downcase
      temporary << char
    else
      words << temporary
      temporary = char.downcase
    end
  end

  words << temporary
  words.join('-')
end


p kebabize('camelsHaveThreeHumps') == 'camels-have-three-humps'
p kebabize('camelsHave3Humps') == 'camels-have-humps'
p kebabize('camels')
p kebabize('camelsH')
p kebabize('camelsHH')
# Notes:
# the returned string should only contain lowercase letters
=end

# Longest alphabetical substring
=begin
Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" 
is "aaaabbbbctt".
There are tests with strings up to 10 000 characters long so your code will need to 
be efficient.
The input will only consist of lowercase characters and will be at least one letter long.
If there are multiple solutions, return the one that appears first.

P
Input: string
Output: string, longest alphabetical substring

Rules:
- find substring, where all letters are in ascending by alphabet order
- string could has repetitive chars
- string contain only lowercase chars
- if only 1 char, return this char

E
"asdfaaaabbbbcttavvfffffdf" --> 1 19 4 6 1 1 1 1 2 2 2 2 3 20 1 22 22 6 6 6 6 6 4 6

D
begin: string
middle: array of subs
end: substring

A
- FIND all substrings
  - create a nested loop
- TRANSFORM substrings into array of chars
  - iterate with select
  - inside the select iterate by map
  - find those that are in ascending order and return
- FIND the longest
  - iterate and return the sub with max size
=end

ALPHABET_HASH = {}
alpha = ('a'..'z')
alpha.each_with_index { |char, index| ALPHABET_HASH[char] = index + 1 }

def longest(string)
  subs = []
  max = string.size
  string.size.times do |start|
    1.upto(max) do |length|
      subs << string[start, length]
    end
    max -= 1
  end

  selected = subs.select do |sub|

    # new_sub = sub.chars.map do |char|
    #   ALPHABET_HASH[char]
    # end

    # new_sub == new_sub.sort
    sub.chars.sort == sub.chars
  end

  selected.max_by { |sub| sub.size }
end




# p longest('asd') #== 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') #== 'aaaabbbbctt'
# p longest('asdfbyfgiklag') =='fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'

=begin
Given a collection of integers, write a method to find the greatest sum that can be obtained by adding consecutive even values or consecutive odd values.

P 
Input: array of integers
Output: integer, which is the greatest sum

Rules: 
- find consecutive odd nnumbers
- find consecutive even numbers
- find among them the greatest sum
- if there is no consecutive numbers, return the biggest num

E 
[1, 2, 3, 4, 5] -> 5
[88, 54, 67, 56, 36] -> 88, 54 = 142  67  56 + 36 = 92

D 
begin: array of nums
middle: integers, subarrays of consecutive nums, array to store sums
end: return integer sum 

A 
- FIND all subarrays starting from 1 element
  - create a new empty array to store subs
  - create a nested loop 
  - first loop is #times and block parameter is my start 
  - second loop is #upto from 1 element till the end of array and block parameter is length
- SELECT subarrays that include only odd or only even values
  - select loop to select subarrays, that all values are odd or even
- TRANSFORM selected subarrays into their sums 
  - map to replace subarrays with their sums
- RETURN the greatest
  - the max of the Array
=end

# C 
def consecutive_sum(array)
  subs = []
  max = array.size
  array.size.times do |start|
    1.upto(max) do |length|
      subs << array[start, length]
    end

    max -= 1
  end

  selected = subs.select do |sub|
    sub.all? { |num| num.even? } || sub.all? { |num| num.odd? }
  end

  selected.map do |sub|
    sub.sum
  end.max
end


p consecutive_sum([1, 1, 1, 1, 1]) == 5
p consecutive_sum([1, 2, 3, 4, 5]) == 5
p consecutive_sum([88, 54, 67, 56, 36]) == 142

=begin

Given a String as an argument, return an Array of all consecutive numbers from the String.
Consecutive numbers being: a series of numbers containing no other non-numeric characters.
Consecutive numbers must be larger than 1 digit, otherwise do not add these to the returned array.
Note: Spaces DO NOT break a series of numbers

P 
Input: string 
Output: array with integer 

Rules: 
- take string with string digits and letters, punctuation signs, spaces
- return all consecutive digits as integers
- if only 1 digit, it is not a consecutive numbers, do. not return it

E 
'Ruby3.32' -> 32
'1 2 3 4' -> remove all spaces from string and then return the numbers 1234
'11abc1!23abc' -> 11, 23

D 
begin: string 
middle: substring of this string, array to contain integers
end: array of integers

A 
- REMOVE all spaces from string 
  - delete ' ' with mutation
- FIND all substring with minimum length of 2
  - create an empty array
  - nested iteration
  - first loop is string size times and block parameter is Start 
  - second loop is 2 up to string size and parameter is length 
  - slice string and add to array
- SELECT only substrings with digits and convert them to integers
  - iterate this array with subs 
  - select by '123'.to_i.to_s == '123'
- RETURN array with integers

- REMOVE all spaces from string 
  - delete ' ' with mutation
- FIND CONSECUTIVE NUMBERS 
  - iterate through the string 
  - create a temporary string 
    - if char.to_i.to_s == char 
      it's integer, add to temporary 
    - else 
      - add temporary to new array 
      - empty temporary
- SELECT THOSE THAT ARE BIGGER THAN 1
- CONVERT to integers 
=end 

def numbers_from_string(string)
  string.delete!(' ')
  subs = []
  temp = ''
  string.each_char do |char|
    if char.to_i.to_s == char
      temp << char
    else
      subs << temp 
      temp = ''
    end
  end

  subs << temp 

  subs.select { |num| num.size > 1 }.map { |num| num.to_i }
end


p numbers_from_string('Ruby3.32') == [32]
p numbers_from_string('abc1234abc') == [1234]
p numbers_from_string('11abc1!23abc') == [11, 23]
p numbers_from_string('hello world!') == []
p numbers_from_string('1 2 3 4') == [1234]
p numbers_from_string('12abc7f24ghi1678!') == [12, 24, 1678]

def toggle_lights(lights)
  all_lights = (1..lights).to_a
  return_lights = all_lights.dup

  2.upto(lights) do |factor|
    all_lights.each do |light|
      if light % factor == 0 && return_lights.include?(light)
        return_lights.delete(light)
      elsif light % factor == 0
        return_lights << light
      end
    end
  end

  return_lights
end

p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]
p toggle_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 
196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

=begin
Implement the function/method, minimum shorten. The function shortens a
sentence such that it will fit within the character limit set. It shortens by removing vowels in the sequence of a, e, i, o, and u. Start removing from the end of the sentence. If it can not be shortened to fit within character limit, return an empty string. Spaces don’t count for the limit.

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
#   return string if limit > string.size

#   vowels = ['a', 'e', 'i', 'o', 'u']
#   if string.delete(' ').size > limit
#     new_str = string.reverse # "ecnetnes tset a si sihT" | "dlroW olleH"
#     vowels.each do |vowel| # 'a'
#       index = 0
#       loop do
#         p "my current char is #{new_str[index]}"
#         if new_str[index] == vowel
#           new_str[index] = ''
#           # p "new_str is #{new_str.delete(" ")}"
#           # p "new_str is #{new_str.delete(" ").size}"
#           return new_str.reverse if new_str.delete(' ').size == limit
#         end
#         break if new_str.delete(' ').size == limit
#         # new_str -> "ecnetnes tset  si sihT"
#         # p new_str.delete(' ').size
#         # break if new_str.delete(' ').size == limit
#         index += 1
#       end
#     end
#   end

# end



# #p minimum_shorten('This is a test sentence', 18) #== 'This is test sentence'
# p minimum_shorten('Hello World', 8) #== 'Hllo Wrld'
# # p minimum_shorten('Short', 10) #== 'Short'
# # p minimum_shorten('A very long sentence with many vowels', 10) #== ''

=begin
# # Implement a method, capitalize, that capitalizes all words in a sentences.
# However, only capitalize if the word is followed by a word starting with a vowel
# (for Ruby don’t use capitalize).

P 
Input: string 
Output: modified with capitalized words string input 

Rules: 
- capitalize all words in a sentence only if they are followed after word which starts from vowel 
- do not use capitalize 

E 
"hello apple world" -> Hello(capitalized because of the apple) apple(after apple is w, so no capitalize) world(after world no vowel again)
"this is an umbrella" -> This (because of the i) Is An umbrella
"every vowel starts an echo" -> every vowel Starts An echo

D 
begin: string 
middle: array of words 
end: return modified String

A 
- DIVIDE by words and preserve in Array
  - split by spaces
- FIND if every word is followed by word with vowel char first
  - iterate with each with index
  - break this loop when index == array size - 1
  - block parameter is every word
  - check array[index + 1][0] is in vowel array?
  - if yes word[0] = word[0].upcase
  - if no go to the next

- CAPITALIZE and return the currnt word 
- CONVERT to string
=end 

def capitalize(string)
  vowels = ['a', 'i', 'o', 'u', 'e']
  words = string.split(' ')
  words.each_with_index do |word, idx|
    break if idx == words.size - 1

    if vowels.include?(words[idx + 1][0])
      word[0] = word[0].upcase
    end
  end
  words.join(' ')
end

# def capitalize(string)
#   string = string.split

#   string.map.with_index do |word, idx|
#     if (idx < string.size - 1) && ('aeiou'.include?(string[idx + 1][0]))
#       word[0] = word[0].upcase 
#     end
#     word
#   end.join(' ')
# end

p capitalize("hello apple world") == "Hello apple world"
p capitalize("this is an umbrella") == "This Is An umbrella"
p capitalize("every vowel starts an echo") == "every vowel Starts An echo"
p capitalize("under the oak tree") == "under The oak tree"
p capitalize("a quick brown fox") == "a quick brown fox"

=begin
# https://www.codewars.com/kata/54d81488b981293527000c8f/train/ruby
Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

Negative numbers and duplicate numbers can and will appear.

8:28
P 
Input: array of integer, integer sum 
Output: array with 2 integers or nil 

Rules:
- find all pairs in Array
- then return that pair which sum is equal to the second arg 
- return nil if there is no such pair of ints 


E 
[1, 4, 8, 7, 3, 15], 8 => 
1 + 4 = 5
1 + 8 = 9
1 + 7 = 8
1 + 3 = 4
1 + 15 = 16

4 + 8 = 12
4 + 7 = 11
4 + 3 = 7
4 + 15 = 19

8
7
3
15 (we do not need the last single num)


[20, -13, 40], -7 => 
20 + -13 = 7
20 + 40 = 60
-13 + 40 = 27

D 
input: array and Integer
middle: subarrays to form all possible pairs, main Array
end: return subarrays

A 
- FIND all pairs of nums
  - create a nested loop 
  - outer loop is # array.size.times method with first num in a pair 
  - inner loop with first num + 1 #upto array size - 1 and it's a second num in a pair 
  - add them in a new empty array as a subarray
- SELECT  by sum which equal to the second arg 
  - iterate with each
  - by iteration find the sum and check if it is equal to the second arg
- RETURN pair when it found this sum
=end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

def sum_pairs(array, sum)
  pairs = {}
  array.size.times do |first|
    (first + 1).upto(array.size - 1) do |second|
      pairs[[array[first], array[second]]] = [first, second]
    end
  end

  selected = pairs.select do |k, v|
    k.sum == sum
  end

  if !selected.empty?
    selected.min_by { |k, v| v[1] }[0]
  else
    nil
  end
end

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]