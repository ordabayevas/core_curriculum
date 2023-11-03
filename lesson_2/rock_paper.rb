VALID_CHOICES = %w(rock paper scissors)

def win?(first, second)
  (first == 'paper' && second == 'rock') ||
    (first == 'rock' && second == 'scissors') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("That's a tie!")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('Not a valid choice')
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{choice}, computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing. Goodbye!')
