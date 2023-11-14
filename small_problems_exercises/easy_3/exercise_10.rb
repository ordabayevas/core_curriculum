def uppercase?(string)
  string.upcase == string
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Food for thought: in our examples, we show that uppercase? should return 
# true if the argument is an empty string. 
# Would it make sense to return false instead? Why or why not?