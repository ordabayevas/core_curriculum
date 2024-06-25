class University
  @@total_number = 0

  def initialize
    @@total_number += 1
  end

  def self.students_num
    @@total_number
  end
end

class Student < University
  def initialize(name, year)
    super()
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

# Further Exploration
Graduate.new('J', 2020, 'on')
Undergraduate.new('S', 2024)
puts University.students_num

