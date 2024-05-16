# Ex_1
=begin
class Person
  # attr_accessor :name
  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
puts bob.name                  # => 'bob'
bob.name = 'Robert'
puts bob.name                  # => 'Robert'
=end

# Ex_2
=begin
class Person
  attr_accessor :first_name
  attr_accessor :last_name

  def name
    @name = @first_name + ' ' + @last_name
  end

  def initialize(name)
    @first_name = name.split.first
    @last_name = name.split.size > 1 ? name.split.last : ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
=end

# Ex_3
=begin
class Person
  attr_accessor :first_name
  attr_accessor :last_name

  def name
    @name = @first_name + ' ' + @last_name
  end

  def name=(name)
    parse_full_name(name)
  end

  def initialize(name)
    parse_full_name(name)
  end

  private

  def parse_full_name(name)
    self.first_name = name.split.first
    self.last_name = name.split.size > 1 ? name.split.last : ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
=end

# Ex_4
=begin
class Person
  attr_accessor :first_name
  attr_accessor :last_name

  def name
    @name = @first_name + ' ' + @last_name
  end

  def name=(name)
    parse_full_name(name)
  end

  def initialize(name)
    parse_full_name(name)
  end

  private

  def parse_full_name(name)
    self.first_name = name.split.first
    self.last_name = name.split.size > 1 ? name.split.last : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name
=end

# Ex_5
class Person
  attr_accessor :first_name
  attr_accessor :last_name

  def name
    @name = @first_name + ' ' + @last_name
  end

  def name=(name)
    parse_full_name(name)
  end

  def initialize(name)
    parse_full_name(name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(name)
    self.first_name = name.split.first
    self.last_name = name.split.size > 1 ? name.split.last : ''
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"