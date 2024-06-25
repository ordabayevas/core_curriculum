require 'pry'
require 'pry-byebug'
class MyCustomError < StandardError;end
class MinilangError < StandardError; end

class Minilang
  def initialize(commands)
    @commands = commands #'5 PUSH 10 PRINT POP PRINT'
    @stack = []
    @register = 0
  end

  def eval
    arr_of_commands = @commands.split(' ')
    arr_of_commands.each do |command|
      if command == 'PUSH'
        push
      elsif command == 'ADD'
        add
      elsif command == 'SUB'
        sub
      elsif command == 'MULT'
        mult
      elsif command == 'DIV'
        div
      elsif command == "MOD"
        mod
      elsif command == 'POP'
        pop
      elsif command == 'PRINT'
        print
      elsif command =~ /\A[-+]?\d+\z/
        n(command)
      else
        raise MyCustomError, "Invalid token: #{command}"
        # binding.pry
      end
    end
  end

  def n(digit)
    @register = digit.to_i
  end

  def push
    @stack << @register
  end

  def add
    @register = @stack.pop + @register
  end

  def sub
    @register = @register - @stack.pop
  end

  def mult
    @register = @register * @stack.pop
  end

  def div
    @register = @register / @stack.pop
  end

  def mod
    @register = @register % @stack.pop
  end

  def pop
    @register = @stack.pop
  end

  def print
    puts @register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
