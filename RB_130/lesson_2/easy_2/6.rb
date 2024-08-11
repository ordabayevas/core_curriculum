def each_with_index(array)
  index = 0
  loop do 
    yield(array[index], index)
    index += 1
    break if index == array.size
  end

  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

