require 'pry'

winning_point = 5
player_score = 0
computer_score = 0
# loop do
#   random = ['Player', 'Computer'].sample
#   if random == 'Player'
#     player_score += 1
#   else random == "Computer"
#     computer_score += 1
#   end
  
#   if player_score == winning_point
#     puts 'Player won 5 times!'
#     break
#   elsif computer_score == winning_point
#     puts 'Computer won 5 times!'
#     break
#   end
# end

while player_score < winning_point && computer_score < winning_point
  random = ['Player', 'Computer'].sample
  if random == 'Player'
    player_score += 1
  else random == "Computer"
    computer_score += 1
  end
end
