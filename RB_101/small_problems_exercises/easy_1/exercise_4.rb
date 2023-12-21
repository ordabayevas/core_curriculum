# What's my bonus
# my solution
def calculate_bonus(salary, bonus)
  if bonus == true
    return salary / 2
  else
    return 0
  end
end

# LS solution
def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000