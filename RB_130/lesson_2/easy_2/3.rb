def map(array)
  return Array.new if array.empty?

  index = 0
  new_arr = []
  loop do
    new_arr << yield(array[index])
    index += 1
    break if index == array.size
  end
  new_arr
end

# def map(array)
#   result = []
#   array.each { |item| result << yield(item) }
#   result
# end

p map([1, 3, 6]) { |value| value**2 } #== [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

