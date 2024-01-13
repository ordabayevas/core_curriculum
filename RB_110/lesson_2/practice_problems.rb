# Practice Problem 1
# arr = ['10', '11', '9', '7', '8']
# descending_arr = arr.sort { |a, b| b.to_i <=> a.to_i }
# p descending_arr # ["11", "10", "9", "8", "7"]

# Practice Problem 2
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# books.sort_by do |book|
#   book[:published]
# end

# Practice Problem 3
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]] # arr1[2][1][3]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}] # arr2[1][:third][0]

# arr3 = [['abc'], ['def'], {third: ['ghi']}] # arr3[2][:third][0][0]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']} # hsh1['b'][1]

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}} # hsh2[:third].key(0)

# Practice Problem 4
# arr1 = [1, [2, 3], 4]
# arr1[1][1] = 4

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# arr2[2] = 4

# hsh1 = {first: [1, 2, [3]]}
# hsh1[:first][2][0] = 4

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# hsh2[['a']][:a][2] = 4

# Practice Problem 5
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# total_male_age = munsters.each_with_object([]) do |(key, value), array|
#   if value["gender"] == 'male'
#     array.push(value["age"])
#   end
# end

# p total_male_age.inject(:+)

# Practice Problem 6
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |key, value|
#   puts "#{key} is a #{value['age']}-year-old #{value['gender']}."
# end

# Practice Problem 7
# a = 2
# b = [5, 8]
# arr = [a, b] # [2, [5, 8]]

# arr[0] += 2 # 2 += 2 --> 4 --> [4, [5, 8]] (arr[0] is another object and doesn't bind to 'a')
# arr[1][0] -= a # [4, [3, 8]] --> a is still 2, arr[1] is still the same object but arr[1][0] was changed
# a = 2 because immutable
# b = [3, 8] because mutable

# Practice Problem 8
# vowels = %w[a e i o u y]
# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# hsh.each_value do |value|
#   value.each do |word|
#     word.chars.each do |char|
#       if vowels.include?(char)
#         puts char
#       end
#     end
#   end
# end

# Practice Problem 9
# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
# new_arr = arr.map do |subarray|
#   subarray.sort do |a, b|
#   b <=> a
#   end
# end

# p new_arr

# Practice Problem 10
# hash = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# new_hash = hash.map do |hsh| # hsh 1.{a: 1}, 2. {b: 2, c: 3}, 3. {d: 4, e: 5, f: 6}
#   a = hsh.map do |key, value|
#     [key, value + 1]
#   end
#   a.to_h
# end

# p hash.object_id
# p new_hash.object_id

# Practice Problem 11
# arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
# index = 0
# new_arr = arr.map do |sub|
#   sub.select do |int|
#     int % 3 == 0
#   end
# end
# p new_arr

# Practice Problem 12
# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# expected return value: 
# {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# option 1
# a = arr.each_with_object({}) do |(key, value), hash|
#   hash[key] = value
# end

# option 2
# new_hsh = {}
# arr.each do |subarray|
#   new_hsh[subarray[0]] = subarray[1]
# end
# p new_hsh

# Practice Problem 13
# arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# arr.sort_by do |sub| # how sort knows what is sub?
#   sub.select do |int|
#     int.odd?
#   end
# end

# Practice Problem 14
# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# hsh.map do |_, value|
#   if value[:type] == 'fruit'
#     value[:colors].map do |color|
#       color.capitalize
#     end
#   elsif value[:type] == 'vegetable'
#     value[:size].upcase
#   end
# end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# Practice Problem 15
# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
# arr.select do |hsh|
#   a = hsh.map do |key, value|
#     value.all? {|el| el.even?}
#   end
#   a.all?
# end

# Practice Problem 16
ARR1 = %w[0 1 2 3 4 5 6 7 8 9 a b c d e f]
SECTION_NUM = 5
SECTION_SIZE = [8, 4, 4, 4, 12]

def uuid
  index = 0
  arr3 = []
  while index != SECTION_NUM
    arr2 = []
    SECTION_SIZE[index].times do |_|
      arr2 << ARR1.sample
    end
    arr3 << arr2.join
    index += 1
  end
  arr3[0] + '-' + arr3[1] + '-' + arr3[2] + '-' + arr3[3] + '-' + arr3[4]
end

p uuid



