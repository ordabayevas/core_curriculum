SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
WINNING_POINT = 21
RISK_POINT = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  # product creates all possible combinations of 2 arrays. 
  # Shuffle returns a new array in random order.
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] } # if ['H', '3'], returns '3'

  sum = 0 # stores all cards sum
  values.each do |value|
    if value == "A" # if value of card is 'A'
      sum += 11 # +11 to cards sum
    elsif value.to_i == 0 # J, Q, K # if other characters, then +10 to cards sum
      sum += 10
    else
      sum += value.to_i # if value is a string digit, then convert to integer
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do 
    # how many 'A' in values array,
    # so many times check the sum, and if there is a 'A' and sum is > than 21, sum -10
    sum -= 10 if sum > WINNING_POINT
  end

  sum # returns integer sum
end

def busted?(cards)
  total(cards) > WINNING_POINT # if total cards are bigger than 21
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > WINNING_POINT
    :player_busted
  elsif dealer_total > WINNING_POINT
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def score(round_result, player_score, dealer_score)
  case round_result
  when :player_busted
    dealer_score += 1
  when :dealer_busted
    player_score += 1
  when :player
    player_score += 1
  when :dealer
    dealer_score += 1
  end

  # prompt "Player's total score is now #{player_score}."
  # prompt "Dealer's total score is now #{dealer_score}."
  #break if player_score == 5 || dealer_score == 5
end

player_score = 0
dealer_score = 0

loop do
  prompt "Welcome to Twenty-One!"

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_total}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      player_total = total(player_cards)

      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    
    dealer_score += 1
    # round_result = detect_result(dealer_cards, player_cards)
    # score(round_result, player_score, dealer_score)
    prompt "Player's total score is now #{player_score}."
    prompt "Dealer's total score is now #{dealer_score}."
    break if player_score == 5 || dealer_score == 5


    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if dealer_total >= RISK_POINT

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)

    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{dealer_total}"
    display_result(dealer_cards, player_cards)

    player_score += 1
    # round_result = detect_result(dealer_cards, player_cards)
    # score(round_result, player_score, dealer_score)
    prompt "Player's total score is now #{player_score}."
    prompt "Dealer's total score is now #{dealer_score}."
    break if player_score == 5 || dealer_score == 5

    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "=============="

  display_result(dealer_cards, player_cards)
  round_result = detect_result(dealer_cards, player_cards)

  case round_result
  when :player_busted
    dealer_score += 1
  when :dealer_busted
    player_score += 1
  when :player
    player_score += 1
  when :dealer
    dealer_score += 1
  end

  prompt "Player's total score is now #{player_score}."
  prompt "Dealer's total score is now #{dealer_score}."
  break if player_score == 5 || dealer_score == 5

  # score(round_result, player_score, dealer_score)
  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"

# Bonus 1. If we will create variables and assign them to total(player_cards)
# and total(dealer_cards), we will need to update them after player's turn, 
# and after dealer's turn.

# Bonus 2. Third play again called without 'next'. Because if we will implement
# the first two without next, it will may continue to go other lines below.

# Bonus 3. 

# Bonus 4. added

# Bonus 5. added