def find_at_risk_square(line, brd) # input - every line and board, output - place to mark
  if brd.values_at(line[0], line[1]).all?(PLAYER_MARKER) && (brd[line[2]] == INITIAL_MARKER)
    return line[2]
  elsif brd.values_at(line[1], line[2]).all?(PLAYER_MARKER) && (brd[line[0]] == INITIAL_MARKER)
    return line[0]
  elsif brd.values_at(line[0], line[2]).all?(PLAYER_MARKER) && (brd[line[1]] == INITIAL_MARKER)
    return line[1]
  elsif brd.values_at(line[0], line[1]).all?(COMPUTER_MARKER) && (brd[line[2]] == INITIAL_MARKER)
    return line[2]
  elsif brd.values_at(line[1], line[2]).all?(COMPUTER_MARKER) && (brd[line[0]] == INITIAL_MARKER)
    return line[0]
  elsif brd.values_at(line[0], line[2]).all?(COMPUTER_MARKER) && (brd[line[1]] == INITIAL_MARKER)
    return line[1]
  else
    nil
  end
end