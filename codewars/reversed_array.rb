def digitize(n)
  n = n.to_s.split('')
  array = []
  while n.length > 0
    last_item = n.pop.to_i
    array << last_item
  end
  array
end

# 35231 => [1,3,2,5,3]
# 0 => [0]
p digitize(35231)
p digitize(0)

# shorter solution from CW

# def digitize(n)
#   n.to_s.chars.reverse.map(&:to_i)
# end