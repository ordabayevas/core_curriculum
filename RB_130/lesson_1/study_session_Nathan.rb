def return_proc
  Proc.new {|str| "Hello #{str}" }
end

p return_proc.call("World")




def return_proc(message)
  Proc.new {|str| "#{message} #{str}" }
end

p return_proc("Hello").call("World")