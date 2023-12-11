def change!(array)
  array.map! do |i|
    if i <= 0
      0
    elsif i == 10
      'A'
    elsif i == 11
      'B'
    elsif i == 12
      'C'
    elsif i == 13
      'D'
    elsif i == 14
      'E'
    elsif i >= 15
      'F'
    else
      i
    end
  end
  array
end

def rgb(r, g, b)
  array = []
  r = r.divmod(16)
  g = g.divmod(16)
  b = b.divmod(16)
  array.push(r, g, b)
  array.each do |subarray|
    if subarray[0] < 0
      subarray[1] = 0
    elsif subarray[0] > 15
      subarray[1] = 15
    end
  end
  array = array.flatten
  change!(array)
  array.join
end

p rgb(173,255,47)

# others solution
# def rgb(r, g, b)
#   [r, g, b].map do |c|
#     if c <= 0 
#       "00"
#     elsif c > 255
#       "FF"
#     else
#       c.to_s(16).upcase ======> returns a string containing the place-value representation of self in radix base (143 => 8f => 8F)
#     end
#   end.join('')
# end