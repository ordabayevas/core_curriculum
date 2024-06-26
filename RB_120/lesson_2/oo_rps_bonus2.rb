class Move
  VALUES = %w[rock paper scissors lizard spock].freeze

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

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other)
    (rock? && other.lizard?) ||
      (paper? && other.rock?) ||
      (scissors? && other.paper?) ||
      (lizard? && other.spock?) ||
      (spock? && other.scissors?) ||
      (lizard? && other.paper?) ||
      (scissors? && other.lizard?) ||
      (spock? && other.rock?) ||
      (rock? && other.scissors?) ||
      (paper? && other.spock?)
  end

  def <(other)
    (rock? && other.paper?) ||
      (paper? && other.scissors?) ||
      (scissors? && other.rock?) ||
      (rock? && other.spock?) ||
      (paper? && other.lizard?) ||
      (scissors? && other.spock?) ||
      (spock? && other.lizard?) ||
      (spock? && other.paper?) ||
      (lizard? && other.scissors?) ||
      (lizard? && other.rock?)
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
      puts 'Please choose one: rock, paper, lizard, spock or scissors'
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
    puts 'Welcome to Rock, Paper, Scissors, Lizard, Spock!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!'
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
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
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    
    display_goodbye_message
    
  end
end

RPSGame.new.play
