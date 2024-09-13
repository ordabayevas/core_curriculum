# "listen", ["enlists", "google", "inlets", "banana"]
class Anagram
  def initialize(word_input)
    @word_input = word_input
  end

  def match(list)
    word_sorted = @word_input.downcase.chars.sort
    anagrams = list
    to_return = anagrams.select do |anagram|
      next if @word_input.downcase == anagram.downcase
      anagram.downcase.chars.sort == word_sorted
    end
  end
end