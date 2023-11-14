def palindrome?(string)
  string.reverse == string
end

def real_palindrome?(string)
  new_string = string.downcase.delete("'").delete(",").delete(" ")
  palindrome?(new_string)
end

p real_palindrome?('Madam')

# LS solution
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

# Read the documentation for String#delete, 
# and the closely related String#count 
# (you need to read count to get all of the information you need for delete.)