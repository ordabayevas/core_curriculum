def is_isogram(string)
  string = string.downcase.split('')
  if string.uniq.count < string.length
    false
  else
    true
  end
end

p is_isogram('Dermatoglyphics')
p is_isogram('moOse')

# better solution from CW
# def is_isogram(string)
#   string.downcase.chars.uniq == string.downcase.chars
# end