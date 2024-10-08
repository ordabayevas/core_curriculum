require 'pry'
require 'pry-byebug'

def bubble_sort!(array)
  swapped = true
  counter = 1
  while swapped == true
    swapped = false
    (array.length - counter).times do |index|
      if block_given?
        next if yield
        array[index] > array[index + 1]
        array[index], array[index+1] = array[index+1], array[index]
        swapped = true
      end
    end
    counter += 1
  end
  array
end

array = [2, 6, 1]
bubble_sort!(array)

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)