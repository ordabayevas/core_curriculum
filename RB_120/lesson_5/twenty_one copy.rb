
class Card
  CARD_VALUES = {'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace'}
  attr_reader :suit, :value_decipher
  attr_accessor :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value_decipher
    if CARD_VALUES.include?(value)
      self.value = CARD_VALUES[value]
    else
      value
    end
  end
end

CARDS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
SUITS = %w[H D C S]

deck = []
SUITS.each do |suit|
  CARDS.size.times do |value|
    deck << Card.new(suit, CARDS[value])
  end
end

p deck[0].value_decipher
p deck[1].value_decipher
p deck[2].value_decipher
p deck[3].value_decipher
p deck[4].value_decipher
p deck[5].value_decipher
p deck[6].value_decipher
p deck[7].value_decipher
p deck[8].value_decipher
p deck[9].value_decipher
p deck[10].value_decipher
p deck[11].value_decipher
p deck[12].value_decipher
p deck[13].value_decipher
p deck[14].value_decipher
p deck[15].value_decipher
p deck[16].value_decipher
p deck[17].value_decipher
p deck[18].value_decipher
p deck[19].value_decipher
p deck[20].value_decipher
p deck[21].value_decipher
p deck[22].value_decipher
p deck[23].value_decipher
p deck[24].value_decipher
p deck[25].value_decipher
p deck[26].value_decipher
p deck[27].value_decipher
p deck[28].value_decipher
p deck[29].value_decipher
p deck[30].value_decipher
p deck[31].value_decipher
p deck[32].value_decipher
p deck[33].value_decipher
p deck[34].value_decipher
p deck[35].value_decipher
p deck[36].value_decipher
p deck[37].value_decipher
p deck[38].value_decipher
p deck[39].value_decipher
p deck[40].value_decipher
p deck[41].value_decipher
p deck[42].value_decipher
p deck[43].value_decipher
p deck[44].value_decipher
p deck[45].value_decipher
p deck[46].value_decipher
p deck[47].value_decipher
p deck[48].value_decipher
p deck[49].value_decipher
p deck[50].value_decipher
p deck[51].value_decipher
p deck[52].value_decipher

