# Method that takes a block and a proc
# def greet(proc_object)
#   # puts "Hello! #{name}" # error
#   yield if block_given?  # Executes the block
#   proc_object.call       # Calls the proc
# end

# name1 = 'Robert'
# # Define a proc
# my_proc = Proc.new { puts "Hi #{name1} and #{name_method} from Proc" } # name 2 and 3 not available

# name2 = 'Sally'

# def name_method
#   'Dennis'
# end

# # Call the method with both a block and a proc
# greet(my_proc) { puts "Hi #{name1} and #{name2} and #{name_method} from block" } #name3 and name_method is not available

# name3 = 'Lily'

# def uppercase_string(string)
#   string.upcase 
# end

# now = Time.now
# uppercase_string('newnnfkjrnvnrvjnnjverjnvrnj')
# after = Time.now

# speed = after - now
# p speed

# def define_speed
#   now = Time.now
#   yield
#   after = Time.now
#   speed = after - now
# end

# p define_speed { Math.sqrt(345613434354543534534 * 42575643654535453) }

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

    assert_equal(book1, book2) # does not work without '==' method
  end
end
