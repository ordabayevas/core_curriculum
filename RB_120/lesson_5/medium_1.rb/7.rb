require 'pry'
require 'pry-byebug'

class GuessingGame
  def initialize(min, max)
    @guess_number = nil
    @guess = nil
    @min_num = min
    @max_num = max
    @secret_num = nil
  end

  def secret_num
    @secret_num = (@min_num..@max_num).to_a.sample
  end

  def number_of_guesses
    @guess_number = Math.log2(@max_num - @min_num).to_i + 1
  end

  def guessing
    puts "You have #{@guess_number} guesses remaining."
    puts "Enter a number between #{@min_num} and #{@max_num}:"
    @guess = gets.chomp.to_i
    @guess_number -= 1
  end

  def won?
    @secret_num == @guess
  end

  def display_result
    if won?
      puts "That's the number!"
    elsif too_low?(@guess)
      puts 'Your guess is too low.'
    elsif too_high?(@guess)
      puts 'Your guess is too high.'
    elsif out_of_range?(@guess)
      puts 'Invalid guess.'
    end
  end

  def too_low?(guess)
    (@min_num...@secret_num).cover?(guess)
  end

  def too_high?(guess)
    ((@secret_num + 1)..@max_num).cover?(guess)
  end

  def out_of_range?(guess)
    guess < @min_num || guess > @max_num
  end

  def win_message
    puts 'You won!'
  end

  def lost_message
    puts "You have no more guesses. Secret number was #{@secret_num}"
    puts 'You lost!'
  end

  def play
    number_of_guesses
    secret_num
    loop do
      guessing
      display_result
      break win_message if won? 
      break lost_message if @guess_number == 0
    end
    puts ' '
  end
end

game1 = GuessingGame.new(1, 1000)
game1.play

game2 = GuessingGame.new(100, 200)
game2.play