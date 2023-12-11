def spin_words(string)
  string_array = string.split(' ')
  string_array.each do |word|
    if word.size >= 5
      word.gsub!(word, word.reverse)
    end
  end
  string_array.join(' ')
end

p spin_words('Great day')