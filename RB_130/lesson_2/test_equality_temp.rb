# require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

# class EqualityTest < Minitest::Test
#   def test_value_equality
#     str1 = "hi there"
#     str2 = "hi there"

#     assert_equal(str1, str2)
#     # assert_same(str1, str2)
#   end
# end

class Book
	attr_reader :title
	
	def initialize(title)
		@title = title
	end
	
	def ==(other)
		title == other.title
		end
end

require 'minitest/autorun'

class BookTest < Minitest::Test
  def test_value_equality
    book1 = Book.new('Dune')
    book2 = Book.new('Dune')

    assert_equal(book1, book2) # do not work without '==' method
  end
end