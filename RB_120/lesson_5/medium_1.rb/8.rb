=begin
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
    suit == other.suit && rank == other.rank
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
=end

# Further Exploration
require 'pry'
require 'pry-byebug'
class Card
  attr_reader :rank, :suit
  RANKS = {1=>1, 2=>2, 3=>3, 4=>4, 5=>5, 6=>6, 7=>7, 8=>8, 9=>9, 10=>10, 
  'Jack'=>11, 'Queen'=>12, 'King'=> 13, 'Ace'=>14}

  SUITS = {'Spades'=>4, 'Hearts'=>3, 'Clubs'=>2, 'Diamonds'=>1}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    # binding.pry
    # RANKS[rank] <=> RANKS[other.rank]
    if RANKS[rank] == RANKS[other.rank]
      SUITS[suit] <=> SUITS[other.suit]
    else
      RANKS[rank] <=> RANKS[other.rank]
    end
  end

  def ==(other)
    suit == other.suit && rank == other.rank
  end

end

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min
puts cards.max
