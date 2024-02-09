# P
# Input: string of commands
# Output: implementing every commands
# Explicit:
# - write a method with 1 string argument
# - implement according to description every command
# - every word in string is a command
# - write every command as a methods
# - implement them as a stack with register
# - register is a current value
# - pop the topmost operation
# - perform the operation using the popped value and the register value
# - then store the result back in the register
# - values for commands will always be integers

# E
# command MULT
# 3 6 4 -> it's a stack, where 4 is the top and 3 is the bottom
# 7 -> register value

# first, it pops the 4 from the stack -> 3 6
# second, popped value * register value -> 4 * 7 = 28
# third, now register value is 28

# if we proceed:
# command MULT
# 3 -> it's a stack
# 168 -> register value

# first, it pops the 6 from the stack -> 3
# second, popped value * register value -> 6 * 28
# third, now register value is 168

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT') => 5 3 8
# reg = 5
# stack = [5, 3]
# PUSH 5, 5, 3
# reg = 3
# MULT reg = 5 * 3
# reg = 15
# stack = [5, 3]
# PRINT reg

# D
# Create an array for stack.
# Register will be a zero.

# A
# - write a method that takes a string
# - convert strings to array with words and call it stack
# - create a variable register and assign to a zero
# - access to every word in array
# - if word is an integer, reassign the register -> create a default method

require 'pry'
require 'pry-byebug'

def minilang(string)
  reg = 0
  stack = []
  string_arr = string.split(' ')
  commands = string_arr.map do |word|
    if word.to_i.to_s == word
      stack << word.to_i
      'n'
    else
      word
    end
  end

  commands.each do |command|
    case command
    when 'n'
      # Place a value n in the "register". Do not modify the stack.
      reg = string_arr[commands.find_index(command)].to_i
      commands[commands.find_index('n')] = 'p'
      #binding.pry
    when 'PUSH'
      # Push the register value on to the stack. Leave the value in the register.
      stack << reg
    when 'ADD'
      # Pops a value from the stack and adds it to the register value, storing the result in the register.
      reg += stack.pop
    when 'SUB'
      # Pops a value from the stack and subtracts it from the register value, storing the result in the register.
      reg -= stack.pop
    when 'MULT'
      # Pops a value from the stack and multiplies it by the register value, storing the result in the register.
      reg *= stack.pop
    when 'DIV'
      # Pops a value from the stack and divides it into the register value, storing the integer result in the register.
      reg = reg / stack.pop
    when 'MOD'
      # Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
      reg = reg % stack.pop
    when 'POP'
      # Remove the topmost item from the stack and place in register.
      reg = stack.pop
    when 'PRINT'
      puts reg
    end
  end
  p stack
end

# minilang('5 PUSH 3 MULT PRINT')
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang('5 PUSH POP PRINT')
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('-3 PUSH 5 SUB PRINT')
# minilang('6 PUSH')
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')   
minilang('5 PUSH 4 MULT PRINT PUSH 3 ADD PRINT SUB SUB PRINT')
# minilang('3 PUSH 5 MOD PRINT PUSH')

# Further exploration
# (3 + (4 * 5) - 7) / (5 % 3)
# reg = 0
# stack = []
# n reg = 4 stack = [_, _, _,_,_,_]
# push reg = 4 stack = 4, 4
# n reg = 5 stack 5, 4, 4
# mult 4 * 5 stack = 5, 4 -> reg = 20, stack = 5, 4


# 4 push 5 mult print