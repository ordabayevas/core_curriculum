# step 1 - display the board
require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]].freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ' '
  puts '     |     |     '
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts '     |     |     '
  puts '-----|-----|-----'
  puts '     |     |     '
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts '     |     |     '
  puts '-----|-----|-----'
  puts '     |     |     '
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts '     |     |     '
  puts ' '
end
# rubocop: enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_hash = {}
  (1..9).each { |num| new_hash[num] = INITIAL_MARKER }
  new_hash
end

# step 2 - ask user to mark a square
def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt 'Sorry, this is not a valid input.'
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, brd) # input - every line and board, output - place to mark
  if brd.values_at(line[0], line[1]).all?(PLAYER_MARKER) && (brd[line[2]] == INITIAL_MARKER)
    return line[2]
  elsif brd.values_at(line[1], line[2]).all?(PLAYER_MARKER) && (brd[line[0]] == INITIAL_MARKER)
    return line[0]
  elsif brd.values_at(line[0], line[2]).all?(PLAYER_MARKER) && (brd[line[1]] == INITIAL_MARKER)
    return line[1]
  else
    nil
  end
end

def offense(line, brd)
  if brd.values_at(line[0], line[1]).all?(COMPUTER_MARKER) && (brd[line[2]] == INITIAL_MARKER)
    return line[2]
  elsif brd.values_at(line[1], line[2]).all?(COMPUTER_MARKER) && (brd[line[0]] == INITIAL_MARKER)
    return line[0]
  elsif brd.values_at(line[0], line[2]).all?(COMPUTER_MARKER) && (brd[line[1]] == INITIAL_MARKER)
    return line[1]
  else
    nil
  end
end

# step 3 - main game
def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = offense(line, brd)
    break if square != nil
  end

  if square == nil
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd)# empty place
      break if square != nil
    end
  end

  if square == nil && brd[5] == INITIAL_MARKER
    square = 5
  elsif square == nil && brd[5] != INITIAL_MARKER
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def first_move_computer(brd)
  first = 5
  second = empty_squares(brd).sample
  square = [first, second].sample
  brd[square] = COMPUTER_MARKER
end

# step 4 - determining a winner
def detect_winner(brd)
  WINNING_LINES.each do |line| # [1, 2, 3]
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd) # '!!' is to return boolean value
end

def main_steps(brd)
  loop do
    display_board(brd)
    player_places_piece!(brd)
    break if someone_won?(brd) || board_full?(brd)

    computer_places_piece!(brd)
    break if someone_won?(brd) || board_full?(brd)
  end
  # loop do
  #   display_board(board)
  #   place_piece!(board, current_player)
  #   current_player = alternate_player(current_player)
  #   break if someone_won?(board) || board_full?(board)
  # end
end

def who_goes_first(iteration_num)
  if iteration_num.odd?
    prompt 'Who goes first? (Player / Computer)'
    choice = gets.chomp.downcase
  else
    choice = ['Player', 'Computer'].sample
    prompt "Now Computer decides who goes first!"
    prompt "Computer chose #{choice}."
    sleep(4)
    choice.downcase
  end
end

# step 5 - play again
player_score = 0
computer_score = 0
iteration_num = 0

loop do
  # binding.pry
  board = initialize_board
  display_board(board)
  iteration_num += 1
  first_move_maker = who_goes_first(iteration_num)

  if first_move_maker.start_with?('p')
    main_steps(board)
  elsif first_move_maker.start_with?('c')
    first_move_computer(board)
    main_steps(board)
  else
    prompt("Invalid choice. Try again")
    next
  end

  display_board(board)

  if someone_won?(board)
    result = detect_winner(board)
    if result == 'Player'
      player_score += 1
    elsif result == "Computer"
      computer_score += 1
    end
  else
    prompt "It's a tie!"
  end

  prompt "Player score is #{player_score}."
  prompt "Computer score is #{computer_score}."
  break if player_score == 5 || computer_score == 5

  prompt 'Play again? (y / n)'
  answer = gets.chomp
  break unless answer.start_with?('y')

end

prompt 'Thanks for the game!'
