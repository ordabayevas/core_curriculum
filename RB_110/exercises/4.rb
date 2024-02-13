# Return substring instance count

=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1
=end

# - given string and substring
# - find a number of substrings in a string
# - counter = 0
# - find the first letter of substring in a string
# - then slice the part of string that begins from the first letter index till substring size
# - compare sliced part with sub
# - if equal add 1 to counter
# - else repeat steps
require 'pry'
require 'pry-byebug'

def solution(string, sub)
  if sub.length == 1
    string.count(sub)
  else
    counter = 0
    loop do
      binding.pry
      start = string.chars.find_index(sub[0])
      break if start == nil
      sliced = string.slice(start, sub.length)
      if sliced == sub
        string.slice!(start, sub.length)
        counter += 1
      else
        string.find_index(sub[0]).slice
      end
    end
    counter
  end
end

#p solution('abcdeb','b') #== 2
#p solution('abcdeb', 'a') #== 1
p solution('abbc', 'bb') #== 1

# Codewars solution
# def solution(full_text, search_text)
#   full_text.scan(search_text).size
# end


