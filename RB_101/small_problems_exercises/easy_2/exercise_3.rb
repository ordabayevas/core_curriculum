# tip calculator
def tip_calculator
  puts 'What is the bill?'
  bill = gets.chomp

  puts 'What is the tip percentage?'
  rate = gets.chomp

  tip = (bill.to_f * (rate.to_f / 100)).round(2)
  total = tip + bill.to_f

  puts "The tip is $#{tip}"
  puts "The total is $#{total}"
end

tip_calculator

# Our solution prints the results as $30.0 and $230.0 instead of the more usual $30.00 and $230.00. 
# Modify your solution so it always prints the results with 2 decimal places.

# def tip_calculator
#   puts 'What is the bill?'
#   bill = gets.chomp

#   puts 'What is the tip percentage?'
#   rate = gets.chomp

#   tip = (bill.to_f * (rate.to_f / 100))
#   total = tip + bill.to_f

#   puts "The tip is $#{'%.2f' % tip}"
#   puts "The total is $#{total}"
# end

# tip_calculator