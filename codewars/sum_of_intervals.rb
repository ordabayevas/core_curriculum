# def sum_of_intervals(intervals)
#   new_intervals = []
#   intervals.each do |subarray|
#     subarray[1].times do |num|
#       if num < subarray[0]
#         next
#       else
#         new_intervals << num
#       end
#     end
#   end
#   a = new_intervals.uniq.size

#   neg_sub = intervals.select do |sub|
#               sub[0] < 0
#             end
#   if neg_sub.empty?
#     return a
#   else
#     neg_sub = neg_sub.flatten
#     pos_sub = neg_sub[0].abs
#     return result = a + pos_sub
#   end

# end

#p sum_of_intervals([[1, 4], [7, 10], [3, 5]])
#p sum_of_intervals([[1, 5], [10, 20], [1, 6], [16, 19], [5, 11]])
#p sum_of_intervals([[0, 20], [-100000000, 10], [30, 40]])
#p sum_of_intervals([[1, 5], [6, 10]])
#p sum_of_intervals([[1, 5]])

def is_overlapping(arr1, arr2)
  total_sum = (arr1[1] - arr1[0]) + (arr2[1] - arr2[0])
  total_interval = [arr1[1], arr2[1]].max - [arr1[0], arr2[0]].min
  total_sum >= total_interval
end

def merge(arr1, arr2)
  left = [arr1[0], arr2[0]].min
  right = [arr1[1], arr2[1]].max
  [left, right]
end

def non_overlapped(intervals)
  non_overlapping_inter = []
  while intervals.length > 0
    subarray = intervals[0]
    intervals = intervals[1..-1]
    if intervals.length == 0
      non_overlapping_inter << subarray
    else
      overlapped = false
      intervals.each_index do |index|
        arr = intervals[index]
        if is_overlapping(subarray, arr)
          intervals[index] = merge(subarray, arr)
          overlapped = true
          next
        end
      end
      if overlapped == false
        non_overlapping_inter << subarray
      end
    end
    # p non_overlapping_inter
  end
  non_overlapping_inter
end

def sum_of_intervals(array)
  new_intervals = non_overlapped(array)
  result = []
  new_intervals.each do |a|
    diff = a[1] - a[0]
    result << diff
  end
  sum_result = result.sum
end



# p sum_of_intervals([[1, 4], [7, 10], [3, 5]])
# p sum_of_intervals([[1, 5], [10, 20], [1, 6], [16, 19], [5, 11]])
# p sum_of_intervals([[0, 20], [-100000000, 10], [30, 40]])
# p sum_of_intervals([[1, 5], [6, 10]])
p sum_of_intervals([[1, 5]])


# better solution
# def sum_of_intervals(intervals)
#   intervals.map{ |i| (i[0]...i[1]).to_a }.flatten.uniq.size
# end
