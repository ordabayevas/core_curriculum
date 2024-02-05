# P
# Explicit requirements:
# - the total amount of cards = 52 # 13 * 4 = 52
# - 4 suits in 52 cards: hearts, diamonds, clubs, and spades
# - 13 values in each suit: 2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace
# - the winning combination is a sum of values of player's cards, which is closer to 21.
#   - but if sum of values > 21 then it's a bust.(lose the game)
# - two players in a game: player and dealer:
#   - initially player has 2 cards and dealer has 2 cards.
#   - player can see 2 cards of his and 1 card of dealer's.
# - the value of cards: 
#   - 2 - 10 has their own value
#   - jack, queen, king = 10
#   - if total sum of cards with ace = 11 is less than 21, ace = 11
#     initially 2 and 5 -> 7 + ace = 18
#   - if total sum of cards with ace = 11 is more than 21, ace = 1
#     initially 5 and jack -> 15 + ace = 16
#     initially 9 and ace -> 20 + ace = 21
#     initially ace and ace -> 12 + ace = 13
# - the game order:
#   - firstly: player and dealer take two random cards each.
#     - player see his cards and 1 dealer'see
#   - secondly: player choose first 'hit'(ask for another card) or 'stay'(do not ask for card, stop).
#     - player choose by on his own decision.
#     - if player's cards sum is over 21 -> lose the game, dealer wins
#     - if player stays, then dealer is choosing cards.
#   - thirdly: dealer hits the cards until amount of his cards is at least 17.
#     - if cards are over 21, the player wins.
#     - if dealer stays, then compare the cards.
#   - fourthly: if no one busts, compare cards and define a winner by the max value from two.

# E
# Dealer has: Ace and unknown card
# You have: 2 and 8
# => hit

# Dealer has: 7 and unknown card
# You have: 10 and 7
# => stay

# Dealer has: 5 and unknown card
# You have: Jack and 6
# => stay

# D
# The deck of cards:
# deck = {2 => [2], 3 => [3], 4 => [4], 
#         5 => [5], 6 => [6], 7 => [7], 
#         8 => [8], 9 => [9],10 => [10], 
#         'jack' => [10], 'queen' => [10], 
#         'king' => [10], 'ace' => [11, 1]}
# deck.keys.sample(2)
# first, second = deck.keys.sample(2)
# card1 = deck[first][0]
# card2 = deck[second][0]
# player = [card1, card2]

# first, second = deck.keys.sample(2)
# card1 = deck[first][0]
# card2 = deck[second][0]
# dealer = [card1, card2]

# deck = [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], 
#         ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], 
#         ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'], 
#         ['H', 'A'], ['D', '2'], ['D', '3'], ['D', '4'], 
#         ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], 
#         ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], 
#         ['D', 'K'], ['D', 'A'], ['S', '2'], ['S', '3'], ['S', '4'], 
#         ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], 
#         ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], 
#         ['S', 'K'], ['S', 'A'], ['C', '2'], ['C', '3'], ['C', '4'], 
#         ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], 
#         ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], 
#         ['C', 'K'], ['C', 'A']]

# A
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.