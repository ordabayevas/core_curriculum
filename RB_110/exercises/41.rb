# Largest product in a series
=begin
Complete the greatestProduct method so that it'll find the greatest product of 
five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

P
Input: string digit
Output: integer, greatest product of five consecutive nums

Rules:
- return all consecutive substrings with length of 5, from left to right
- convert them into integers
- find their products
- return the max product
- input is always more than 5 digits

E
"123834539327238239583" -> 1*2*3*8*3 = 144, 2*3*8*3*4 = 576, 3*8*3*4*5 = 1440, 8*3*4*5*3 = 1440,
3*4*5*3*9 = 1620, 4*5*3*9*3 = 1620, 5*3*9*3*2 = 810, 3*9*3*2*7 = 1134, 9*3*2*7*2 = 756,
3*2*7*2*3 = 252, 2*7*2*3*8 = 672, 7*2*3*8*2 = 672, 2*3*8*2*3 = 288, 3*8*2*3*9 = 1296,
8*2*3*9*5 = 2160, 2*3*9*5*8 = 2160, 3*9*5*8*3 = 3240

D
Use array to store all substring products.

A
- FIND all substrings with length 5, moving to one digit to the right
  - 0..4, 1..5, 2..6 and etc. till the last range ends with the element of idx [-1]
  - every substring store to array
- TRANSFORM all substrings into integers
  - iterate over subs
- FIND the product of every integer substring
  - create a variable product and multiply every digit by other with converting
  - push all products to a new array
- RETURN the largest product
  - find the max num
=end

# C
def greatest_product(string_num)
  subs = []
  string_num.each_char.with_index do |digit, idx|
    sub = string_num.slice(idx, 5)
    subs << sub
    break if idx == (string_num.size - 5)
  end
  
  products = subs.map do |sub|
    sub.chars.inject(1) { |prod, n| prod * n.to_i}
  end

  products.max
end

p greatest_product("123834539327238239583") #== 3240
p greatest_product("395831238345393272382") #== 3240
p greatest_product("92494737828244222221111111532909999") #== 5292
# p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") #== 0
