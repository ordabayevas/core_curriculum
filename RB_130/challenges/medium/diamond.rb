require 'pry'
require 'pry-byebug'

# def find_chars(letter)
#   diamond_letters = []
#   'A'.ord.upto(letter.ord) do |num|
#     diamond_letters << num.chr
#   end
#   diamond_letters
# end

# def diamond(letter) # C
#   letters = find_chars(letter)
#   space_counter = -1

#   puts "#{' ' * (letters.size - 1) + 'A'}"
#   1.upto(letters.size - 1) do |idx|
#     space_counter += 2
#     cur_letter = letters[idx]
#     first_spaces = ' ' * (letters.size - (idx + 1))
#     second_spaces = (' ' * space_counter)

#     puts "#{first_spaces + cur_letter + second_spaces + cur_letter}" # upper letters
#   end

#   (letters.size - 2).downto(1) do |idx|
#     space_counter -= 2
#     cur_letter = letters[idx]
#     first_spaces = ' ' * (letters.size - (idx + 1))
#     second_spaces = (' ' * space_counter)

#     puts "#{first_spaces + cur_letter + second_spaces + cur_letter}" # bottom letters
#   end
#   puts "#{' ' * (letters.size - 1) + 'A'}"
# end

# diamond('E')

class Diamond
  def self.find_chars
    diamond_letters = []
    'A'.ord.upto(@letter.ord) do |num|
      diamond_letters << num.chr
    end
    diamond_letters
  end

  def self.make_diamond(letter)
    @space_counter = -1
    @letter = letter
    @letters = find_chars

    if @letter == 'A'
      "A\n"
    else
      upper_letters + bottom_letters
    end
  end

  def self.upper_letters
    first_row = "#{' ' * (@letters.size - 1) + 'A' + ' ' * (@letters.size - 1)}\n"
    result = ''

    1.upto(@letters.size - 1) do |idx|
      @space_counter += 2
      cur_letter = @letters[idx]
      first_spaces = ' ' * (@letters.size - (idx + 1))
      second_spaces = (' ' * @space_counter)

      result += "#{first_spaces + cur_letter + second_spaces + cur_letter + first_spaces}\n" # upper letters
    end

    first_row + result
  end

  def self.bottom_letters
    last_row = "#{' ' * (@letters.size - 1) + 'A' + ' ' * (@letters.size - 1)}\n"
    result = ''

    (@letters.size - 2).downto(1) do |idx|
      @space_counter -= 2
      cur_letter = @letters[idx]
      first_spaces = ' ' * (@letters.size - (idx + 1))
      second_spaces = (' ' * @space_counter)

      result += "#{first_spaces + cur_letter + second_spaces + cur_letter + first_spaces}\n" # bottom letters
    end
    
    result + last_row
  end
end

# puts Diamond.make_diamond('B')
# puts Diamond.make_diamond('C') 
