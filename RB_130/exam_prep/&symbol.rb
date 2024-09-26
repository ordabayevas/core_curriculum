# source https://fine-ocean-68c.notion.site/Passing-in-a-Proc-as-a-block-to-method-call-71431f12acba4489ab22d98a3c6a5c6d
# Problem
# def call_this
# 	yield(2)
# end

# to_s = Proc.new { |arg| arg.to_i }
# to_i = Proc.new { |arg| arg.to_s }

# p call_this(&to_s) # => returns 2
# p call_this(&to_i) # => returns "2"

# Code Breakdown
# 1. The call_this Method:
# def call_this
#   yield(2)
# end
# This method takes a block and calls it using yield.
# The yield(2) passes the value 2 to the block (or proc) that is provided when call_this is called.
# 2. The to_s and to_i Procs:
# to_s = Proc.new { |arg| arg.to_i }
# to_i = Proc.new { |arg| arg.to_s }
# to_s is a proc that takes one argument (arg) and converts it to an integer (arg.to_i).
# to_i is a proc that takes one argument and converts it to a string (arg.to_s).
# 3. Calling call_this(&to_s) and call_this(&to_i)
# In Ruby, the & symbol converts a proc into a block when passing it to a method. Here's how this works with call_this:

# call_this(&to_s):

# to_s is a proc that converts its argument to an integer (arg.to_i).
# The method call_this yields the value 2 to the block.
# So yield(2) in call_this becomes to_s.call(2), which is effectively 2.to_i.
# Since 2 is already an integer, 2.to_i simply returns 2.
# Result: 2

# call_this(&to_i):

# to_i is a proc that converts its argument to a string (arg.to_s).
# Again, call_this yields the value 2 to the block.
# So yield(2) in call_this becomes to_i.call(2), which is 2.to_s.
# 2.to_s converts the number 2 into the string "2".
# Result: "2"

def call_with_block(&block)
  yield  # Calls the block passed to the method
end

call_with_block { puts "Hello from the block!" }
# => Hello from the block!

