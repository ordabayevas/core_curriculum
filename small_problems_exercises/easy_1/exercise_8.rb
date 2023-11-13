def reversed_number(number)
  numbers = number.to_s.split('')
  new_numbers_array = []
  while numbers.size != 0
    last_digit = numbers.pop
    new_numbers_array << last_digit
  end
  return new_numbers_array.join.to_i
end

p reversed_number(122)