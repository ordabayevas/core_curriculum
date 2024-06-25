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
    @deck_of_cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        # binding.pry
        @deck_of_cards << Card.new(rank, suit)
      end
    end
    @deck_of_cards.shuffle!
  end
end

class PokerHand
  attr_reader :deck, :hand

  def initialize(deck)
    @hand = []
    @deck = deck
    add_cards
  end

  def print
    puts hand
  end

  def add_cards
    5.times { |_| hand << deck.draw }
  end

  def evaluate
    # binding.pry
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private
  def ranks
    ranks = []
    hand.each {|card| ranks << card.rank }
    ranks
  end

  def suits
    suits = []
    hand.each {|card| suits << card.suit }
    suits
  end

  def royal_flush?
    win_combo = [10, 'Jack', 'Queen', 'King', 'Ace']

    if suits.all?(suits.first)
      selected = ranks.select { |rank| win_combo.include?(rank) }.size
      return selected == 5
    end

    false
  end

  def straight_flush?
    if suits.all?(suits.first)
      return (Card::RANKS[hand.max.rank] - Card::RANKS[hand.min.rank]) == 4
    end

    false
  end

  def four_of_a_kind?
    nested_ranks1 = ranks.partition {|rank| rank == ranks[0]}
    nested_ranks2 = ranks.partition {|rank| rank == ranks[1]}
    (nested_ranks1[0].size == 4) || (nested_ranks1[0].size == 4)
  end

  def full_house?
    three_same_rank = nil
    5.times do |i|
      nested_rank = ranks.partition {|rank| rank == ranks[i]}
      three_same_rank = nested_rank[0]
      break if three_same_rank.size == 3
    end

    two_same_rank = nil
    5.times do |i|
      nested_rank = ranks.partition {|rank| rank == ranks[i]}
      two_same_rank = nested_rank[0]
      break if two_same_rank.size == 2
    end

    (three_same_rank.size == 3) && (two_same_rank.size == 2)
  end

  def flush?
    suits.all?(suits.first)
  end

  def straight?
    # binding.pry
    min_rank = Card::RANKS[hand.min.rank]
    hand.map {|card| Card::RANKS[card.rank]}.sort == min_rank.upto(min_rank + 4).to_a
    # (Card::RANKS[hand.max.rank] - Card::RANKS[hand.min.rank]) == 4
  end

  def three_of_a_kind?
    three_same_rank = nil
    5.times do |i|
      nested_rank = ranks.partition {|rank| rank == ranks[i]}
      three_same_rank = nested_rank[0]
      break if three_same_rank.size == 3
    end

    three_same_rank.size == 3
  end

  def two_pair?
    first_pair = nil
    second_pair = nil

    5.times do |i|
      nested_rank = ranks.partition {|rank| rank == ranks[i]}
      first_pair = nested_rank[0]
      if first_pair.size == 2
        3.times do |n|
          next_three_ranks = nested_rank[1]
          second_pair = next_three_ranks.partition {|rank| rank == next_three_ranks[n]}
          return true if second_pair[0].size == 2
        end
      end
    end

    false
  end

  def pair?
    two_same_rank = nil
    5.times do |i|
      # binding.pry
      nested_rank = ranks.partition {|rank| rank == ranks[i]}
      two_same_rank = nested_rank[0]
      break if two_same_rank.size == 2
    end

    two_same_rank.size == 2
  end
end

# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'