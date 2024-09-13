# {1 => [A, E, I, O, U, L, N, R, S, T], 2 => [D, G], 3 => [B, C, M, P], 4 => [F, H, V, W, Y], 5 => [K], 8 => [J, X], 10 => [Q, Z]}
require 'pry'
require 'pry-byebug'
class Scrabble
  SCORE = {1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'], 2 => ['D', 'G'], 3 => ['B', 'C', 'M', 'P'], 4 => ['F', 'H', 'V', 'W', 'Y'], 5 => ['K'], 8 => ['J', 'X'], 10 => ['Q', 'Z']}
  
  def initialize(word)
    @word = word
  end

  def score
    score_counter = 0
    return score_counter if @word.nil?
    @word.chars.each do |letter|
      SCORE.each do |key, value|
        if value.include?(letter.upcase)
          score_counter += key
        end
      end
    end
    score_counter
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
#p score('cabbage')