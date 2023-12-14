# first solution

# def first_non_repeating_letter(s) 
#   string = s.clone.downcase
#   string.each_char do |char|
#     count = string.count(char)
#     if count > 1
#       string.delete!(char)
#     end
#   end

#   if s.length == 1
#     return s
#   elsif string.length == s.length && string.length != 0
#     return s.chr
#   elsif string.length == s.length && string.length == 0
#     return ''
#   else
#     first_letter = string.chr
#     if s.include?(first_letter)
#       return first_letter
#     else
#       first_letter.upcase
#     end
#   end
# end

# p first_non_repeating_letter('mqwhNkCPv')

# second solution (mine)

def first_non_repeating_letter(s)
  array = s.downcase.split('')
  array.each do |char|
    if s.length == 1
      return s
    elsif array.one?(char)
      if s.include?(char)
        return char
      else
        return char.upcase
      end
    else
      next
    end
  end
  return ''
end

p first_non_repeating_letter('momo')

