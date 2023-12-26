str = "joe's favorite color is blue"
str # => "Joe's favorite color is blue"
new_str = str.split
new_str.each do |word|
  word.capitalize!
end

sentence = new_str.join(' ')

p sentence