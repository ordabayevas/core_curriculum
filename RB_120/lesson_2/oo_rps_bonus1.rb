# Option 1 - as a state
=begin
class Move
  VALUES = %w[rock paper scissors].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other)
    (rock? && other.scissors?) || (paper? && other.rock?) || (scissors? && other.paper?)
  end

  def <(other)
    (rock? && other.paper?) || (paper? && other.scissors?) || (scissors? && other.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?

      puts 'Sorry, please enter a value.'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose one: rock, paper or scissors'
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts 'Sorry, invalid choice.'
    end

    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w[Chappie R2D2 Hal].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer
  @@human_score = 0
  @@comp_score = 0

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors. Good bye!'
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      @@human_score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      @@comp_score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name} score: #{@@human_score}"
    puts "#{computer.name} score: #{@@comp_score}"
    if @@human_score == 10
      puts "#{human.name} won this game!"
    elsif @@comp_score == 10
      puts "#{computer.name} won this game!"
    end
  end

  def ten_points?
    @@human_score == 10 || @@comp_score == 10
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def play_again?
    answer = nil
    loop do
      puts 'Do you want to play again? (y / n)'
      answer = gets.chomp
      break if %w[y n].include?(answer.downcase)

      puts 'Sorry, must be y or n.'
    end

    return true if answer == 'y'

    return false
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        display_score
        break if ten_points?
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
=end

# Option 2 - as a new class
class Move
  VALUES = %w[rock paper scissors].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other)
    (rock? && other.scissors?) ||
      (paper?&& other.rock?) ||
      (scissors? && other.paper?)
  end

  def <(other)
    (rock? && other.paper?) ||
      (paper? && other.scissors?) ||
      (scissors? && other.rock?)
  end

  def to_s
    @value
  end
end

class Score
  def initialize
    @score = 0
  end

  def +(num)
    @score = @score + num
  end

  def to_s
    "#{@score}"
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = Score.new
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?

      puts 'Sorry, please enter a value.'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose one: rock, paper or scissors'
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts 'Sorry, invalid choice.'
    end

    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w[Chappie R2D2 Hal].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors. Good bye!'
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.score.+(1)
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.score.+(1)

    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name} score is: #{human.score}"
    puts "#{computer.name} score is: #{computer.score}"
    if human.score == 10
      puts "#{human.name} won this game!"
    elsif computer.score == 10
      puts "#{computer.name} won this game!"
    end
  end

  def ten_points?
    human.score == 10 || computer.score == 10
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def play_again?
    answer = nil
    loop do
      puts 'Do you want to play again? (y / n)'
      answer = gets.chomp
      break if %w[y n].include?(answer.downcase)

      puts 'Sorry, must be y or n.'
    end

    return true if answer == 'y'

    return false
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        display_score
        break if ten_points?
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
# Human.new.score


