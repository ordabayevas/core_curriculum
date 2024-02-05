require 'pry'
require 'pry-byebug'

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  cards = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  suits = %w[H D C S]
  deck = []
  suits.each do |val|
    cards.size.times do |index|
      deck << [val, cards[index]]
    end
  end
  deck
end

def deal_cards(deck)
  cards = { 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace' }
  card1 = deck.delete(deck.sample)
  card2 = deck.delete(deck.sample)
  hand = [card1, card2]
  hand.each do |card|
    card[1] = cards[card[1]] if cards.keys.include?(card[1])
  end
end

def hit_card(deck)
  cards = { 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace' }
  new_card = deck.delete(deck.sample)
  if cards.include?(new_card[1])
    new_card[1] = cards[new_card[1]]
  end
  new_card
end

def evaluate_cards(hand)
  values = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
             '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
             'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 11 }
  nums = hand.map do |subarray|
    values[subarray[1]]
  end

  if nums.include?(11) && nums.sum > 21
    nums[nums.find_index(11)] = 1
  end
  nums
end

def comparing_results(player_nums, dealer_nums)
  if player_nums.sum > dealer_nums.sum
    true
  elsif player_nums.sum < dealer_nums.sum
    false
  end
end

def display_results(boolean, player_nums, dealer_nums)
  if boolean == true
    prompt 'Player won!'
  elsif boolean == false
    prompt 'Dealer won!'
  else
    prompt "It's a tie!"
  end
  prompt "Player score is #{player_nums.sum}."
  prompt "Dealer score is #{dealer_nums.sum}."
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def player_hits_card(deck, player_hand, player_nums)
  loop do
    # binding.pry
    player_new_card = hit_card(deck)
    player_hand << player_new_card
    prompt "Your new card now is #{player_new_card[1]}."
    player_nums = evaluate_cards(player_hand)

    prompt "Now you have #{player_nums}"
    if player_nums.sum > 21
      prompt "It's a bust! You lose."
      break
    elsif player_nums.sum <= 21
      prompt 'Want to hit again? (h / s)'
      answer = gets.chomp.downcase
      break unless answer.start_with?('h')

    end
  end
  player_nums
end

loop do
  prompt "Welcome to Twenty-One!"
  
  deck = initialize_deck

  player_hand = deal_cards(deck)
  player_nums = evaluate_cards(player_hand)
  prompt "You have: #{player_hand[0][1]} and #{player_hand[1][1]}."
  prompt "Your sum of cards is #{player_nums.sum}."

  p dealer_hand = deal_cards(deck)
  dealer_nums = evaluate_cards(dealer_hand)
  prompt "Dealer has: #{dealer_hand.sample[1]} and unknown card."

  prompt "Player's turn to choose: hit or stay (h / s)"
  choice = gets.chomp.downcase

  if choice.start_with?('h')
    player_nums = player_hits_card(deck, player_hand, player_nums)
  elsif choice.start_with?('s')
    prompt 'You chose to stay.'
  end

  prompt "Your cards total is #{player_nums.sum}."

  if player_nums.sum > 21
    play_again? ? next : break
  end

  prompt "Now Dealer's turn to choose..."
  # binding.pry
  while dealer_nums.sum <= 17
    prompt 'Dealer takes a card.'
    dealer_hand << hit_card(deck)
    dealer_nums = evaluate_cards(dealer_hand)

    if dealer_nums.sum > 21
      puts dealer_nums
      prompt "It's a bust! Dealer lose."
      break
    end
  end

  if dealer_nums.sum > 21
    play_again? ? next : break
  end

  prompt 'Dealer stays.'
  p dealer_nums

  result = comparing_results(player_nums, dealer_nums)
  display_results(result, player_nums, dealer_nums)

  break unless play_again?
end

prompt 'Thanks for the game!'
