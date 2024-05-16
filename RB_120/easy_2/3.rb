
class House
  def price
    @price
  end

  def initialize(price)
    @price = price
  end

  def to_s
    "#{price}"
  end

  # def compare(another)
  #   self.price < another.price
  # end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1.compare(home2)
# puts "Home 2 is more expensive" if home2.compare(home1)
puts "Home 1 is cheaper" if home1.to_s.to_i < home2.to_s.to_i
puts "Home 2 is more expensive" if home2.to_s.to_i > home1.to_s.to_i
