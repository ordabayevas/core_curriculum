# Write a method that takes a string as an argument, and returns true 
# if all parentheses in the string are properly balanced, false otherwise. 
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# If number of parentheses is odd, then return false.
# If number of parentheses is even:
#   - add '(' while not ')'
#     - if ')'
require 'pry'
require 'pry-byebug'

def balanced?(string)
  parentheses = string.chars.select { |char| char == '(' || char == ')' }
  open = []
  close = []
  parentheses.each do |par|
    if par == ')'
      close << par
      # binding.pry
      if open.size >= close.size
        next
      else
        return false
      end
    else
      open << par
    end
  end
  open.size == close.size
end

# p balanced?('What ((is))) up(')
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
