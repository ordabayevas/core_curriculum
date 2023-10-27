# Information:
# - the loan amount
# - the Annual Percentage Rate (APR)
# - the loan duration

# Calculate:
# - monthly interest rate
# - loan duration in months
# - monthly payment

# Formula:
# monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))

def interest_calc(percentage)
  return (percentage / 100) / 12
end

def term_calc(years)
  return years * 12
end

puts 'Welcome to Loan Calculator! Please enter following information for calculation.'

loop do
  puts ('Loan Amount: ')
  loan_amount = gets.chomp.to_f

  puts ('Interest Rate: ')
  rate = gets.chomp.to_f
  interest = interest_calc(rate)

  puts ('Loan Term: ')
  loan_term = gets.chomp.to_i
  term = term_calc(loan_term)

  payment = ''
  def monthly_payment(amount, interest, term)
    payment = amount * (interest / (1 - (1 + interest)**(-term)))
    return payment
  end

  result = monthly_payment(loan_amount, interest, term)
  puts ("Your monthly payment is #{result}")

  puts ('Do you would like to calculate another loan payment?')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

puts ('Goodbye!')
