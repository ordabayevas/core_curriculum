def is_an_ip_number?(string_number) # '4'=>4
  if string_number.to_i.to_s == string_number
    (0..255).cover?(string_number.to_i)
  else
    false
  end
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size != 4
    return false
  end
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    if is_an_ip_number?(word) == false
      return false
    end
  end
  return true
end

p dot_separated_ip_address?("10.4.5.11.12") # => false