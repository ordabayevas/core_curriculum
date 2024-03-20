# subarray_sums = []
# array = [-2, 1, -3]

  # start_idx = 0
  # loop do
  #   length = 1

  #   loop do
  #     subarray_sums << array.slice(start_idx, length)
  #     length += 2
  #     break if length > (array.size - start_idx)
  #   end

  #   start_idx += 2
  #   break if start_idx > array.size
  # end

  # p subarray_sums

array = [-2, 1, -3]
subarray_sums = []
max_range = array.size

array.size.times do |start_idx|
  if start_idx.odd?
    next
  end

  1.upto(max_range) do |length|
    if length.even?
      next
    end

    subarray_sums << array[start_idx, length]
  end
  max_range -= 1
end

p subarray_sums
