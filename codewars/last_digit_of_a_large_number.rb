def last_digit(n1, n2)
  if n2 != 0
    first_num = n1 % 10
    case first_num
    when 1
      m = 1
    when 5
      m = 1
    when 6
      m = 1
    when 2
      m = 4
    when 3
      m = 4
    when 4
      m = 2
    when 7
      m = 4
    when 8
      m = 4
    when 9
      m = 2
    when 0
      m = 1
    end
    q = (n2 - 1) / m
    exp = n2 - m * q
    result = (first_num ** exp).digits[0]
  else
    return 1
  end
end

# last_digit(4, 1)
#p last_digit(4, 2)
#p last_digit(10, 10 ** 10)
#p last_digit(2 ** 200, 2 ** 300)
#p last_digit(3715290469715693021198967285016729344580685479654510946723, 68819615221552997273737174557165657483427362207517952651)
# p last_digit(570465971859848600648, 548525188141437300000000000000000000000000000000416)
# p last_digit(22788975964958620000000000000000000104, 43352263345281350000000000000730)
p last_digit(1885802184871008000000000000000000000000262, 8244203748428850000000000000000000000000000000000000716)