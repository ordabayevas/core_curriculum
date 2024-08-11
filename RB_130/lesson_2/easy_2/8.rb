def max_by(array)
  max_el = nil
  index = 0
  return max_el if array.empty?
    
  array.each_with_index do |element, i|
    if max_el.nil?
      max_el = yield(element)
      index = i
    elsif max_el < yield(element)
      max_el = yield(element)
      index = i
    end
  end

  array[index]
end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil