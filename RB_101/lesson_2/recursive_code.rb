def find_max(arg)
  p "Arg = #{arg}"
  if arg.length == 1
    return arg[0]
  elsif arg.length == 2
    x = arg[0]
    y = arg[1]
    if x < y
      return y
    else
      return x
    end
  else
    n = arg.length
    arg1 = arg[0..n/2]
    p "Arg1 = #{arg1}"
    arg2 = arg[(n/2 + 1)..-1]
    p "Arg2 = #{arg2}"
    x = find_max(arg1)
    y = find_max(arg2)
    return find_max([x, y])
  end
end

p find_max([1,4,7,2,5])