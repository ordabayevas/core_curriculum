# # Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat', 'dog')

# Proc is a block turned to an object. It has an object id and can be referenced by variable.
# Proc is a class.
# To implement the block inside the Proc object we can use Object#call. And if we do not pass
# any argument, then block parameter is also undefined and nil and do not throws an error.
# If argument passed, to proc's call, argument binds to block parameter. If we pass more than
# one argument, but we have only 1 block parameter, we also do not have an error.

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# puts my_third_lambda.class
# my_proc = Proc.new { |thing| puts "This is a #{thing}." }
# puts my_proc

# A new Lambda object can be created with a call to lambda or ->.
# Lambda is part of a Proc class. It is also takes block.
# While a Lambda is a Proc, it maintains a separate identity from a plain Proc. 
# This can be seen when displaying a Lambda: the string displayed contains 
# an extra "(lambda)" that is not present for regular Procs.
# It can be called just like an other Proc object with Object#call.
# If we do not pass the right number of args, it throws an error.
# Lambda is not an independent class and we cannot create a new lambda with 'new' method.

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Block was implicitly passed in the 1st case, and the method takes 1 argument.
# Inside the method we have 'yield' which is yields to implicitly passed block and implements
# the block. Block has 1 parameter, but nothing was passed to the block call, so block
# parameter is nil and does not raises an error, just like procs.
# But it does raises an error if no block is passed to the method, beacuse we didn't define 
# the if statement with #block_given?

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# This time we passed the method argument to 'yield'. And it binds to block parameter.
# Again passing less args to more parameters does not raises an error, just 
# empty parameters are placed with nil.
# Blocks will throw an error if a variable is referenced that doesn't 
# exist in the block's scope.

# Proc is a class, Lambdas and Blocks are not.
# Procs and Lambdas are blocks that are objects.
# Lambda will raise an error if you pass more or less arguments to the block inside,
# Procs and Blocks does not.