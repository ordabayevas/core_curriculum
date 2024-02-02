# def main_steps(brd)
  # loop do
  #   display_board(board)
  #   place_piece!(board, current_player)
  #   current_player = alternate_player(current_player)
  #   break if someone_won?(board) || board_full?(board)
  # end
# end
current_player = first_move_maker

def place_piece!(brd, current_player)
  if current_player.start_with?('p')
    square = ''
    loop do
      prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
      square = gets.chomp.to_i
      break if empty_squares(brd).include?(square)
  
      prompt 'Sorry, this is not a valid input.'
    end
    brd[square] = PLAYER_MARKER
  elsif current_player.start_with?('c')
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
end

def alternate_player(current_player)
  if current_player.start_with?('p')
    current_player = 'c'
  elsif current_player.start_with?('c')
    current_player = 'p'
  end
end







def first_move_computer(brd)
  first = 5
  second = empty_squares(brd).sample
  square = [first, second].sample
  brd[square] = COMPUTER_MARKER
end