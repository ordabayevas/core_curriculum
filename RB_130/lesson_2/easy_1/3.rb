def missing(sorted_array)
  min = sorted_array[0]
  max = sorted_array[-1]
  missed_nums = []
  while min != max
    min += 1
    missed_nums << min if !sorted_array.include?(min)
  end
  missed_nums
end



p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5]) #== [2, 3, 4]
p missing([6]) #== []