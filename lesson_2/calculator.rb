# asks for two numbers
#asks for the type of operation to perform: add, subtract, multiply or divide
#perform the operation on the two numbers
#displays the 

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts('Welcome to Calculator!')

Kernel.puts('Enter first number:')
number1 = Kernel.gets().chomp()

Kernel.puts('Enter second number:')
number2 = Kernel.gets().chomp()

Kernel.puts('What kind of operation would you like to perform? 1)add 2)subtract 3)multiply 4)divide')
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is: #{result}")