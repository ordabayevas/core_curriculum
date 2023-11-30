# Variant 2
def is_valid_walk(walk)
  if walk.length == 10
    counter_s = 0
    counter_n = 0
    counter_w = 0
    counter_e = 0
    walk.select! do |i|
      if i == 's'
        counter_s += 1
      elsif i == 'n'
        counter_n += 1
      elsif i == 'w'
        counter_w += 1
      else 
        counter_e +=1
      end
    end
    if (counter_e == counter_w) && (counter_n == counter_s)
      true
    else
      false
    end
  else
    false
  end
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s'])
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e'])
p is_valid_walk(['w'])
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s'])
p is_valid_walk(['s', 'e', 'w','n', 'n', 's', 'n', 'w', 'n', 's'])



# Variant 1
# doesn't pass all test

# def is_valid_walk(walk)
#   if walk.length == 10
#     walk.map! do |dir|
#       (dir == "n" || dir == "e") ? 1 : -1
#     end
#   else
#     return false
#   end

#   if walk.sum == 0
#     true
#   else
#     false
#   end
# end



# best solution from Codewars

# def isValidWalk(walk)
# 	walk.count('w') == walk.count('e') and
#   walk.count('n') == walk.count('s') and
#   walk.count == 10
# end