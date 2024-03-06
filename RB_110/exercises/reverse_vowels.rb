VOWELS = 'aioueAIOUE'
def reverseVowels(string)
  selected_vowels = []
  string.each_char.with_index do |char, idx|
    if VOWELS.include?(char)
      selected_vowels << char
      string[idx] = '0'
    end
  end

  string.each_char.with_index do |char, idx|
    if char == '0'
      string[idx] = selected_vowels.pop
    end
  end

  string

end

p reverseVowels("Reverse Vowels In A String")