def next_bigger(n)
  num_arr = n.digits
  prev = nil
  prev_list = []
  num_arr.each do |i|
    if prev.nil?
      prev = i
      prev_list << i
      next
    end
    answer = []
    if i < prev
      # solution
      found_answer = false
      prev_list.each do |j|  # 1, 3, 7
        if j <= i
          answer << j
        else
          if found_answer
            answer << j
          else
            answer.unshift(j)
            answer << i # 3, 1, 2, 7
            found_answer = true
          end
        end
      end
      answer = num_arr.reverse[0..-answer.length-1] + answer
      return answer.join.to_i
    else
      prev = i
      prev_list << i
    end
  end
  return -1
end

p next_bigger(22731)










# def next_bigger(n)
#   num_arr = n.digits.reverse # [2,0,1,7]
#   combinations = num_arr.permutation.to_a # 24 comb
#   valid_combinations = []
#   combinations.each do |sub|
#     sub_in_num = sub.join.to_i # [2, 0, 1, 7] => '2017' => 2017
#     if sub_in_num > n
#       valid_combinations.push(sub_in_num)
#     end
#   end
#   valid_combinations.min
# end

# p next_bigger(2017)















# def next_bigger(n)
#   new_n = n.digits
#   array = []
#   while new_n.size > 0
#     array << new_n.max
#     new_n.delete(new_n.max)
#   end
#   array
# end

# p next_bigger(2017)