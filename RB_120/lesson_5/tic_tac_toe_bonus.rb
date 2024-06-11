require 'pry'
require 'pry-byebug'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[3, 5, 7], [1, 5, 9]]

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '     |     |'
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def [](num)
    @squares[num].marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # def count_human_marker(squares)
  #   squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  # end

  # def count_computer_marker(squares)
  #   squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  #   # collect is alias for map
  #   # squares => [#<Square:0x00000001029f5f58 @marker="X">,
  #                 #<Square:0x00000001029f5ee0 @marker=" ">,
  #                 #<Square:0x00000001029f5e90 @marker=" ">]
  #   # squares.collect { |square| square.marker }
  # end

  def three_identical_markers?(squares)
    markers = squares.reject(&:unmarked?).collect(&:marker)
    return false if markers.size != 3

    markers.min == markers.max
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker             # => return the marker, whatever it is
      end
    end
    nil
  end

  # def winning_marker #returns winning marker or nil
  #   WINNING_LINES.each do |line|
  #     binding.pry
  #     if count_human_marker(@squares.values_at(*line)) == 3
  #       return TTTGame::HUMAN_MARKER
  #     elsif count_computer_marker(@squares.values_at(*line)) == 3
  #       return TTTGame::COMPUTER_MARKER
  #     end
  #   end

  #   WINNING_LINES.each do |line|
  #     binding.pry
  #     squares = @squares.values_at(*line).collect(&:marker)
  #     if squares[0] == squares[1] &&
  #       squares[1] == squares[2] &&
  #       squares[0] != ' ' &&
  #       squares[1] != ' ' &&
  #       squares[2] != ' '
  #       return squares[0]
  #     end
  #   end
  #   nil
  # end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # def risk_square(h_marker) # input - every line and board, output - place to mark
    # WINNING_LINES.each do |line|
    #   square_1 = @squares.values_at(line[0], line[1]).collect(&:marker)
    #   square_2 = @squares.values_at(line[1], line[2]).collect(&:marker)
    #   square_3 = @squares.values_at(line[0], line[2]).collect(&:marker)
    #   binding.pry
    #   if square_1.all?(TTTGame::HUMAN_MARKER) && @squares[line[2]].marker == Square::INITIAL_MARKER
    #     return line[2]
    #   elsif square_2.all?(TTTGame::HUMAN_MARKER) && @squares[line[0]].marker == Square::INITIAL_MARKER
    #     return line[0]
    #   elsif square_3.all?(TTTGame::HUMAN_MARKER) && @squares[line[1]].marker == Square::INITIAL_MARKER
    #     return line[1]
    #   end
    # end
    # nil

    # WINNING_LINES.each do |line|
    #   if @squares.values_at(*line).collect(&:marker).count(h_marker) == 2
    #     return @squares.select { |k, v| line.include?(k) && v.marker == Square::INITIAL_MARKER}.keys.first
    #   end
    # end
    # nil
  # end

  def combination_square(h_or_c_markers)
    WINNING_LINES.each do |line|
      if @squares.values_at(*line).collect(&:marker).count(h_or_c_markers) == 2
        # binding.pry
        return @squares.select { |k, v| line.include?(k) && v.marker == Square::INITIAL_MARKER}.keys.first
      end
    end
    nil
  end
end

class Square
  INITIAL_MARKER = ' '.freeze
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :name
  def initialize(marker, name)
    @marker = marker
    @name = name
  end
end

class TTTGame
  X_MARKER = 'X'.freeze
  O_MARKER = 'O'.freeze
  # FIRST_TO_MOVE = HUMAN_MARKER

  def initialize
    #binding.pry
    # custom_marker
    @board = Board.new
    # @human = Player.new(@h_marker)
    # @computer = Player.new(@c_marker)
    @current_player = nil
    @human_score = 0
    @comp_score = 0
    @turn_to_choose_first_to_move = :human
  end


  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  attr_reader :board, :human, :computer

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ''
  end

  def display_goodbye_message
    puts 'Thank you for playing Tic Tac Toe! Goodbye!'
  end

  def initialize_players
    player_names
    @human = Player.new(@h_marker, @human_name)
    @computer = Player.new(@c_marker, @comp_name)
  end

  def player_names
    puts 'Please enter your name:'
    @human_name = gets.chomp

    @comp_name = %w(Hal Walle).sample
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when @h_marker
      puts 'You won!'
      @human_score += 1
    when @c_marker
      puts 'Computer won!'
      @comp_score += 1
    else
      puts "It's a tie!"
    end

    display_score
  end

  def display_board
    puts "#{human.name} is a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def joinor(array, sign=', ', word='or')
    new_string = ''
    if array.empty? || array.size == 1
      return array[0].to_s
    elsif array.size == 2
      new_string << "#{array[0]} #{word} #{array[1]}"
    else
      new_array = array.slice(0..-2)
      last_element = "#{word} #{array[-1]}"
      new_array.each { |num| new_string << "#{num}#{sign}" }
      new_string << last_element
    end
  end

  def human_moves
    puts "Choose a square between (#{joinor(board.unmarked_keys)}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)

      puts 'Sorry, not a valid choice.'
    end

    board[square] = human.marker
  end

  def computer_moves
    # binding.pry
    if board.combination_square(computer.marker) != nil
      board[board.combination_square(computer.marker)] = computer.marker
    elsif board.combination_square(human.marker) != nil
      board[board.combination_square(human.marker)] = computer.marker
    elsif board[5] == Square::INITIAL_MARKER
      board[5] = computer.marker
    else
      board[board.unmarked_keys.to_a.sample] = computer.marker
    end
  end

  def custom_marker
    puts "Please choose your marker: X or O"
    answer = nil
    loop do
      answer = gets.chomp.upcase
      break if [X_MARKER, O_MARKER].include?(answer)

      puts 'Sorry, not a valid choice.'
    end

    if answer == X_MARKER
      @h_marker = X_MARKER
      @c_marker = O_MARKER
    elsif answer == O_MARKER
      @h_marker = O_MARKER
      @c_marker = X_MARKER
    end
  end

  def who_goes_first
    if @turn_to_choose_first_to_move == :human
      puts "Who goes first? (#{human.name} - 1 / #{computer.name} - 2)"
      answer = nil
      loop do
        answer = gets.chomp
        break if %w(1 2).include?(answer)

        puts 'Sorry, not a valid choice.'
      end

      answer == '1' ? (@current_player = human.marker) : (@current_player = computer.marker)
      @turn_to_choose_first_to_move = :computer
    else
      puts "#{computer.name} will choose first to move player!"
      choice = [human.name, computer.name].sample
      choice == human.name ? (@current_player = human.marker) : (@current_player = computer.marker)
      puts "Computer chose: #{choice}"
      sleep(4)
      @turn_to_choose_first_to_move = :human
    end
  end

  def current_player_moves
    if @current_player == human.marker
      human_moves
      @current_player = computer.marker
    else
      computer_moves
      @current_player = human.marker
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w[y n].include?(answer)

      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def reset
    board.reset
    # @current_player = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def human_turn?
    @current_player == human.marker
  end

  def player_move
    # who_goes_first
    loop do
      current_player_moves
      break if board.someone_won? || board.full? 

      clear_screen_and_display_board if human_turn?
    end
  end

  def main_game
    loop do
      custom_marker
      initialize_players
      display_board
      who_goes_first
      player_move
      display_result
      break if score_is_5?
      break unless play_again?

      reset
      display_play_again_message
    end
  end

  def display_score
    puts "#{human.name} score is #{@human_score}."
    puts "#{computer.name} score is #{@comp_score}."
  end

  def score_is_5?
    (@human_score == 5) || (@comp_score == 5)
  end
end

game = TTTGame.new
game.play
