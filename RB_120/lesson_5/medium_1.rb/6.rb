require 'pry'
require 'pry-byebug'

class GuessingGame
  def initialize
    @guess_number = 7
    @secret_num = nil
  end

  def guessing
    puts "You have #{@guess_number} guesses remaining."
    puts 'Enter a number between 1 and 100:'
    @guess = gets.chomp.to_i
    @guess_number -= 1
  end

  def won?
    @secret_num == @guess
  end

  def display_result
    @secret_num = (1..100).to_a.sample
    if won?
      puts "That's the number!"
    else
      error_msgs(@guess)
    end
  end

  def error_msgs(guess)
    if (1...@secret_num).cover?(guess)
      # binding.pry
      puts 'Your guess is too low.'
    elsif ((@secret_num + 1)..100).cover?(guess)
      puts 'Your guess is too high.'
    else
      'Invalid guess.'
    end
  end

  def play
    loop do
      guessing
      display_result
      break 'You won!' if won? 
      break if @guess_number == 0
    end
    puts 'You have no more guesses. You lost!'
  end
end

game = GuessingGame.new
game.play

# Further Exploration

class Player
  attr_reader :make_a_guess
  
  def initialize
    @choice = nil
  end

  def make_a_guess
    @choice = gets.chomp
  end
end

class GuessingGame
  def initialize
    @guess_number = 7
    @secret_num = nil
    @player = Player.new
  end

  def guessing
    puts "You have #{@guess_number} guesses remaining."
    puts 'Enter a number between 1 and 100:'
    @guess = @player.make_a_guess
    @guess_number -= 1
  end
end

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!