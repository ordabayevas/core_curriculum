VALID_CHOICES = %w(rock paper scissors lizard spock)

ABBREVIATIONS = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

COMBINATIONS = { 
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
}

def win?(first, second)
  COMBINATIONS[first].include?(second)
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
    prompt("Choose one: #{VALID_CHOICES.join(', ')} (or print first letter)")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break 
    elsif ABBREVIATIONS.include?(choice)
      choice = ABBREVIATIONS[choice]
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
