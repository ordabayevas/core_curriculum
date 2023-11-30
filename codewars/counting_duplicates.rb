def duplicate_count(text)
  text_array = text.downcase.split('')
  counter = 0
  while text_array.size > 0
    letter = text_array[0]
    if text_array[1..].include?(letter)
      counter += 1
    end
    text_array.delete(letter)
  end
  counter
end

puts duplicate_count('inditisibility')