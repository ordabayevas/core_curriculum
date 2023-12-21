# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# perform the operation on the two numbers
# displays the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'eng'

def messages(message, lang)
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(oper)
  word = case oper
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end
return word
end

prompt('welcome')
name = ''
loop do
  name = Kernel.gets.chomp
  if (name.empty?)
    prompt('valid_name')
    break
  else
    break
  end
end

puts("=> Hi #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt('first_num')
    number1 = Kernel.gets.chomp
    if valid_number?(number1)
      if number1.include?('.')
        number1 = number1.to_f
      else
        number1 = number1.to_i
      end
      break
    else
      prompt('valid_num')
    end
  end

  number2 = ''
  loop do
    prompt('second_num')
    number2 = Kernel.gets.chomp
    if valid_number?(number2)
      if number2.include?('.')
        number2 = number2.to_f
      else
        number2 = number2.to_i
      end
      break
    else
      prompt('valid_num')
    end
  end

  prompt('operator_prompt')

  operator = ''
  loop do
    operator = Kernel.gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator')
    end
  end

  Kernel.puts("=> #{operation_to_message(operator)} the two numbers...")
  result = case operator
          when '1'
            number1 + number2
          when '2'
            number1 - number2
          when '3'
            number1 * number2
          when '4'
            number1.to_f / number2.to_f
          end
  Kernel.puts("=> The result is: #{result}")

  prompt('another_operation')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('farewell')