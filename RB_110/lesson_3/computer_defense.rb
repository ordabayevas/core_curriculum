# def computer_places_piece!(brd)
#   square = empty_squares(brd).sample
#   brd[square] = COMPUTER_MARKER
# end

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # WINNING_LINES[0][]
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
# if [1, 2] or [2, 3] or [1, 3]:
#   (line[0] && line[1]) are 'X', then place the 'O' on line[2]
# if (line[1] && line[2]) are 'X', then place the 'O' on line[0]
# if (line[0] && line[2]) are 'X', then place the 'O' on line[1]


move = false
WINNING_LINES.each do |line|
  if brd.values_at(line[0], line[1]).all?(PLAYER_MARKER) && (brd[line[2]] == INITIAL_MARKER)
    brd[line[2]] = COMPUTER_MARKER
    move = true
    break
  elsif brd.values_at(line[1], line[2]).all?(PLAYER_MARKER) && (brd[line[0]] == INITIAL_MARKER)
    brd[line[0]] = COMPUTER_MARKER
    move = true
    break
  elsif brd.values_at(line[0], line[2]).all?(PLAYER_MARKER) && (brd[line[1]] == INITIAL_MARKER)
    brd[line[1]] = COMPUTER_MARKER
    move = true
    break
  end
end

if !move
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end