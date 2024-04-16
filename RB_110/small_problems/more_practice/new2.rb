# 0,0 0,1 0,2 0,3 0,4
# 1,0 1,1 1,2 1,3 1,4
# 2,0 2,1 2,2 2,3 2,4
# 3,0 3,1 3,2 3,3 3,4
# 4,0 4,1 4,2 4,3 4,4

# 0,0 0,1 0,2 0,3 0,4
# 1,1 1,2 1,3 1,4
# 2,2 2,3 2,4
# 3,3 3,4
# 4,4

# array = []
# 5.times do |first_num|
#   next if first_num.odd?
#   5.times do |second_num|
#     next if second_num.odd?
#     array << [first_num, second_num]
#   end
# end
# p array

# array = []
# 5.times do |i|
#   i.upto(4) do |j|
#     array << [first_num, second_num]
#   end
# end

# array = []
# first_num = 0
# loop do
#   array << first_num
#   first_num += 1
#   break if first_num > 4
# end

# array = []
# first_num = 0
# loop do
#   second_num = first_num
#   loop do
#     array << [first_num, second_num]
#     second_num += 1
#     break if second_num > 2
#   end
#   first_num += 1
#   break if first_num > 2
# end

string = 'abcde'

# length
# 0, 5
# 1, 4
# 2, 3
# 3, 2
# 4, 1

# end
# 0, 4
# 1, 4
# 2, 4
# 3, 4
# 4, 4

# subs = []
# last = string.size - 1
# string.size.times do |start|
#   subs << string[start..last]
# end

# p subs
# 0,2 1,2 2,2 3,2

# 0,0 0,1 0,2
# 1,1 1,2
# 2,2

# 0,1 0,2 0,3
# 1,1 1,2
# 2,1
# subarrays = []
# start = 0
# max_range = array.size

# loop do
#   length = 1
#   loop do
#     subarrays << array[start, length]
#     break if length == max_range
#     length += 1
#   end

#   max_range -= 1
#   break if start == (array.size - 1)
#   start += 1
# end

# subarrays = []
# max_range = array.size
# (array.size - 1).times do |start|
#   length = 2
#   subarrays << array[start, length]
# end

# p subarrays

#   0  1  2  3  4
# [[1, 0, 0, 0, 0], 0
#  [2, 2, 0, 0, 0], 1
#  [3, 3, 3, 0, 0], 2
#  [4, 4, 4, 4, 0]] 3

# 0,0 0,1 0,2 0,3 0,4
# 1,0 1,1 1,2 1,3 1,4
# 2,0 2,1 2,2 2,3 2,4
# 3,0 3,1 3,2 3,3 3,4

# n = 4
# [["a"],
#  ["ab",   "ab"],
#  ["abc",  "abc",  "abc"],
#  ["abcd", "abcd", "abcd", "abcd"]]

# n = 1
# [["a"]]

alphabet = ('a'..'z').to_a.join
n = 4
array = []
start = 0
1.upto(n) do |length|
  subarray = []
  length.times do |_|
    subarray << alphabet[start, length]
  end
  array << subarray
end


p array