# practice 1
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# index = 0
# a = flintstones.each_with_object ({}) do |name, hash|
#       hash[name] = index
#       index += 1
#     end
# puts a

# practice 2
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# puts ages.values.sum

# practice 3
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# new_ages = ages.select do |name, age|
#             age < 100
#           end
# p new_ages

# practice 4
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# p ages.values.min

# practice 5
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# ind = 0
# flintstones.each_with_index do |name, index|
#   if name.start_with?('Be')
#     ind = index
#   end
# end
# p ind

# practice 6
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# for name in flintstones
#   name.slice!(3..-1)
# end

# practice 7
# statement = "The Flintstones Rock"
# statement_arr = statement.chars.uniq.reject { |i| i == ' ' } # ["T", "h", "e", "F", "l", "i", "n", "t", "s", "o", "R", "c", "k"]
# statement_hash =  statement_arr.each_with_object ({}) do |letter, hash|
#                     n = statement.count(letter)
#                     hash[letter] = n
#                   end
# p statement_hash

# practice 8
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number # 1, 
#   numbers.shift(1) # [2, 3, 4]
# end

# practice 9
# words = "the flintstones rock"
# new_words = words.split(' ')
# for word in new_words do
#   word.capitalize!
# end
# new_words.join(' ')

# practice 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, values|
  case values['age']
  when (0..17)
    values["age_group"] = 'kid'
  when (18..64)
    values["age_group"] = 'adult'
  else
    values["age_group"] = 'senior'
  end
end

p munsters

