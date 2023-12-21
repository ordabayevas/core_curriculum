# my solution
def repeat(string, number)
  while number != 0
    number -= 1
    puts string
  end
end

repeat('Hello', 3)

# LS solution
def repeat(string, number)
  number.times do
    puts string
  end
end

repeat('Hello', 3)