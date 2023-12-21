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

player_point = 0
computer_point = 0

def points_counter(winner, player_point, computer_point)
  if winner == 'player'
    player_point += 1
  elsif winner == 'computer'
    computer_point += 1
  end
  prompt("You have #{player_point} points")
  prompt("Computer has #{computer_point} points")
  return player_point, computer_point
end

def win?(first, second)
  COMBINATIONS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
    return 'player'
  elsif win?(computer, player)
    prompt('Computer won!')
    return 'computer'
  else
    prompt("That's a tie!")
    return 'tie'
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

  result = display_results(choice, computer_choice)

  player_point, computer_point = points_counter(result, player_point, computer_point)

  if computer_point == 3
    prompt('Gamer over. Computer win!')
    break
  elsif player_point == 3
    prompt('Congrats. You win!')
    break
  else
    prompt('Do you want to play again?')
    answer = Kernel.gets().chomp()
    break unless answer.downcase.start_with?('y')
  end

end

prompt('Thank you for playing. Goodbye!')
