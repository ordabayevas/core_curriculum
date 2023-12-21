# Information:
# - the loan amount
# - the Annual Percentage Rate (APR)
# - the loan duration

# Calculate:
# - monthly interest rate
# - loan duration in months
# - monthly payment

# Formula:
# monthly_payment = amount * (interest / (1 - (1 + interest)**(-term)))

def interest_calc(percentage)
  (percentage / 100) / 12
end

def term_calc(years)
  years * 12
end

def valid_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

def monthly_payment(amount, interest, term)
  amount * (interest / (1 - ((1 + interest)**(-term))))
end

def prompt(message)
  puts("=> #{message}")
end

prompt('Welcome to Loan Calculator!')
prompt('Please enter following information for calculation.')

loop do
  loan_amount_input = ''
  loop do
    prompt('Loan Amount: ')
    loan_amount_input = gets.chomp
    if valid_number?(loan_amount_input)
      loan_amount_input = loan_amount_input.to_f
      break
    else
      prompt('Please enter numerical input')
    end
  end

  rate_input = ''
  loop do
    prompt('Interest Rate: ')
    rate_input = gets.chomp
    if valid_number?(rate_input)
      rate_input = rate_input.to_f
      break
    else
      prompt('Please enter numerical input')
    end
  end

  term_input_years = ''
  term_input_months = ''
  loop do
    prompt('Loan Term:')
    prompt('Enter in years:')
    term_input_years = gets.chomp
    prompt('Enter additional months: (if term only in years type 0)')
    term_input_months = gets.chomp
    if valid_number?(term_input_years && term_input_months)
      term_input_years = term_input_years.to_f
      break
    else
      prompt('Please enter numerical input')
    end
  end

  interest = interest_calc(rate_input)
  term = term_calc(term_input_years)
  total_term = term + term_input_months.to_f
  puts total_term

  result = monthly_payment(loan_amount_input, interest, total_term)
  prompt("Your monthly payment is #{result.round(2)}")

  prompt('Calculate another loan payment? (to continue type Y)')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Goodbye!')
