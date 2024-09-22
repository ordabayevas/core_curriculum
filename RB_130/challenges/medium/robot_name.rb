# P
# - robot name consists from BC811 two letters, and three nums
# - generate random every boot time
# - check if name wasn't generated earlier
# - write methods:
#   - first boot: generate random name and was not generated earlier
#   - reset: generate the random name that is not the previous name, and delete the old name

# E
# from test cases:
# method name -> saves and shows the name
# every time robot is created there is a new name generated

# D 
# array to save all previous names

class Robot
  attr_accessor :name

  @@old_names = []

  def initialize
    @name = valid_name
    @@old_names << @name
  end

  def self.old_names
    @@old_names
  end

  def valid_name
    new_name = generate_name
    if @@old_names.include?(new_name)
      loop do 
        new_name = generate_name
        break if !@@old_names.include?(new_name)
      end
    end
    new_name
  end

  def reset 
    @@old_names.delete(name)
    self.name = valid_name
  end

  def generate_name
    ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + ('0'..'9').to_a.sample + ('0'..'9').to_a.sample + ('0'..'9').to_a.sample
  end
end

# r1 = Robot.new
# p r1.name
# r2 = Robot.new
# p r2.name

# p r1.name
# p r2

# p Robot.old_names
# r1.reset 
# p Robot.old_names
