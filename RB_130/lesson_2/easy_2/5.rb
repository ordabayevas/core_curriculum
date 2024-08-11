require 'pry'
require 'pry-byebug'

def drop_while(array)
  return_arr = []
  array.each_with_index do |element, index|
    #binding.pry
    if yield(element) == false
      return_arr = array.slice(index..-1)
      break
    end
  end

  return_arr
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []