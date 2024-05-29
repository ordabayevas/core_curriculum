class Parent
  def hello(subject="World")
    puts "Hello, #{subject}"
  end
end

class Child < Parent
  def hello(subject)
    puts super(subject)
    puts "How are you today?"
  end
end

child = Child.new
child.hello('Bob')

# What will be output if we run this code?
# How can we get it to output the following?

# Hello, Bob
# How are you today?


# What are the different ways we can implement inheritance in ruby?