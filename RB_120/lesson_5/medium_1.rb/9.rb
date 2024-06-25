require 'pry'
require 'pry-byebug'

class Card
  attr_reader :rank, :suit
  RANKS = {1=>1, 2=>2, 3=>3, 4=>4, 5=>5, 6=>6, 7=>7, 8=>8, 9=>9, 10=>10, 
  'Jack'=>11, 'Queen'=>12, 'King'=> 13, 'Ace'=>14}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    RANKS[rank] <=> RANKS[other.rank]
  end

  def ==(other)
    # binding.pry
    suit == other.suit && rank == other.rank
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    reset_deck
  end

  def draw
    if @deck_of_cards.empty?
      reset_deck
    end
    @deck_of_cards.pop
  end

  def reset_deck
    SUITS.each do |suit|
      RANKS.each do |rank|
        @deck_of_cards << Card.new(rank, suit)
      end
    end
    @deck_of_cards.shuffle!
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.