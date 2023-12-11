def sum_of_intervals(intervals)
  new_intervals = []
  intervals.each do |subarray|
    subarray[1].times do |num|
      if num < subarray[0]
        next
      else
      new_intervals << num
      end
    end
  end
  a = new_intervals.uniq.size

  neg_sub = intervals.select do |sub|
              sub[0] < 0
            end
  if neg_sub.empty?
    return a
  else
    neg_sub = neg_sub.flatten
    pos_sub = neg_sub[0].abs
    return result = a + pos_sub
  end

end

#p sum_of_intervals([[1, 4], [7, 10], [3, 5]])
#p sum_of_intervals([[1, 5], [10, 20], [1, 6], [16, 19], [5, 11]])
#p sum_of_intervals([[0, 20], [-100000000, 10], [30, 40]])
#p sum_of_intervals([[1, 5], [6, 10]])
p sum_of_intervals([[1, 5]])







# new_intervals = []
#   for subarray in intervals do
#     new_sub = subarray[0]...subarray[1]
#     new_intervals << new_sub
#   end