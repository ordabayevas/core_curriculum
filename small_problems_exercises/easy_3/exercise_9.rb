def palindrome?(string)
  string.reverse == string
end

def palindromic_number?(number)
  string_num = number.to_s
  palindrome?(string_num)
end

p palindromic_number?(123210)
p palindromic_number?(22)
p palindromic_number?(5)


# if number starts with 0 like 01210, we can use '0%o' % number.to_s