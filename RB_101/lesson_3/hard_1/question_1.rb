if false
  greeting = "hello world"
end

# When you initialize a local variable within an if clause, 
# even if that if clause doesn’t get executed, the local variable is initialized to nil.
p greeting # => nil