# Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

# Here is an overview of the game:
# - Both participants are initially dealt 2 cards from a 52-card deck.
# - The player takes the first turn, and can "hit" or "stay".
# - If the player busts, he loses. If he stays, it's the dealer's turn.
# - The dealer must hit until his cards add up to at least 17.
# - If he busts, the player wins. If both player and dealer stays, then the highest total wins.
# - If both totals are equal, then it's a tie, and nobody wins.

# Nouns: card, player, dealer, participant, deck, game, total
# Verbs: deal, hit, stay, busts

# Player
# - hit
# - stay
# - busted?
# - total
# Dealer
# - hit
# - stay
# - busted?
# - total
# - deal (should this be here, or in Deck?)
# Participant
# Deck
# - deal (should this be here, or in Dealer?)
# Card
# Game
# - start

require 'pry'
require 'pry-byebug'

class Participant
  attr_accessor :hand

  def hit(deck)
    @new_card = deck.deal
    hand << @new_card
  end

  def total
    values = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
    '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
    'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 11 }

    sum = 0

    hand.each do |card|
      if card.value == 'Ace' && sum > 10
        sum += 1
      else
        # binding.pry
        sum += values[card.value]
      end
    end
    sum
  end
end

class Player < Participant
  attr_accessor :hand

  def initialize
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end

  def hit(deck)
    super

    puts '*****'.center(80)
    puts "Your new card is #{@new_card.value_decipher}."
    puts "Now you have #{total}."
  end

  def stay
    puts '*****'.center(80)
    puts 'You chose to stay.'
  end

  def busted?
    if total > 21
      puts '*****'.center(80)
      puts 'You busted!'
      true
    end
  end
end

class Dealer < Participant
  def initialize
    # seems like very similar to Player... do we even need this?
  end

  def hit(deck)
    super

    puts '*****'.center(80)
    puts 'Dealer took a new card.'
  end

  def stays
    puts '*****'.center(80)
    puts 'Dealer chose to stay.'
  end

  def busted?
    if total > 21
      puts '*****'.center(80)
      puts 'Dealer busted!'
      true
    end
  end
end

class Deck
  CARDS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SUITS = %w[H D C S]

  attr_reader :deck, :deal

  def initialize
    @deck = []
    SUITS.each do |suit|
      CARDS.size.times do |value|
        @deck << Card.new(suit, CARDS[value])
      end
    end
  end

  def deal
    @card = deck.delete(deck.sample)
  end
end

class Card
  attr_reader :suit 
  attr_accessor :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value_decipher
    card_values = {'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace'}
    if card_values.include?(value)
      self.value = card_values[value]
    else
      value
    end
  end
end

class Game
  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def clear
    system 'clear'
  end

  def deal_cards
    card1 = deck.deal
    card2 = deck.deal
    player.hand = [card1, card2]

    card3 = deck.deal
    card4 = deck.deal
    dealer.hand = [card3, card4]
  end

  def show_initial_cards
    player.hand.each do |card|
      card.value = card.value_decipher
    end

    puts '*****'.center(80)
    puts "You have #{player.hand[0].value} and #{player.hand[1].value}"

    dealer.hand.each do |card|
      card.value = card.value_decipher
    end

    puts '*****'.center(80)
    puts "Dealer has #{dealer.hand.sample.value} and unknown card"
  end

  def player_turn
    loop do
      puts '*****'.center(80)
      puts 'Do you want a new card? (y/n)'
      answer = nil

      loop do
        answer = gets.chomp.downcase
        break if %w(y n).include?(answer)

        puts 'Sorry, invalid choice. Must be y or n.'
      end

      if answer == 'y'
        player.hit(deck)
        player.total
        # binding.pry
        break if player.busted?
      else
        player.stay
        break
      end

    end
  end

  def dealer_turn
    # binding.pry
    loop do
      if dealer.total < 17
        # binding.pry
        dealer.hit(deck)
        dealer.total
        break if dealer.busted?
      else
        dealer.stays
        break
      end
    end
  end


  def show_result
    if player.total > dealer.total
      puts '*****'.center(80)
      puts "You have #{player.total}."
      puts "Dealer has #{dealer.total}."
      puts 'You won!'
    else
      puts '*****'.center(80)
      puts "You have #{player.total}."
      puts "Dealer has #{dealer.total}."
      puts 'Dealer won!'
    end
  end

  def welcome
    puts '*****'.center(80)
    puts 'Welcome to Twenty One game!'
  end

  def goodbye
    puts '*****'.center(80)
    puts 'Game over. Thanks for playing Twenty One!'
    puts '*****'.center(80)
  end

  def play_again?
    puts '*****'.center(80)
    puts "Do you want to play again? (y or n)"
    answer = gets.chomp
    answer.downcase.start_with?('y')
  end

  def start
    clear
    welcome
    loop do
      deal_cards
      show_initial_cards
      player_turn
      break if player.busted?
      
      dealer_turn
      break if dealer.busted?

      show_result
      break unless play_again?
      clear
    end
    goodbye
  end
end

Game.new.start
