# P
# - create clock that independent from date
# - we need to be able to adding and subtracting minutes
# - do not use built-in methods
# - not mutate Clock objects when adding and subtracting minutes - create a new Clock object

# E
# clock looks like string "08:00"
# we can use 23, 22 hours
# methods:
# - self.at(hour, minutes=0) -> should return new Clock with hour and minutes, takes two ints hour and minutes
# - + and - method, to update hour and minutes
# - to_s -> to represent the time as a string "08:00"

# frozen_string_literal: true

class Clock
  attr_accessor :hour, :minutes

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.at(h, min=0)
    new(h, min)
  end

  def +(new_min)
    new_h, new_min = new_min.divmod(60)
    old_h = hour 
    old_min = minutes
    updated_h = old_h + new_h
    updated_m = old_min + new_min

    updated_h = hour_formatting(updated_h)
    Clock.new(updated_h, updated_m)
  end

  def hour_formatting(non_form)
    if non_form > 24
      non_form -= 24 until (non_form < 24)
      non_form
    elsif non_form == 24
      non_form = 0
    elsif non_form == 0
      non_form = 24
    else
      non_form
    end
  end

  def minutes_formatting(non_form)
    if non_form == 0
      non_form = 60
    else
      non_form
    end
  end

  def -(new_min)
    new_h, new_min = new_min.divmod(60)

    old_h = hour_formatting(hour) # 10
    old_min = minutes # 0

    if new_min > old_min # 1 > 0 true
      old_h = old_h - 1 # 9
    end

    if new_h > old_h
      new_h = hour_formatting(new_h)
    end

    updated_h = old_h - new_h # 9 - 51
    updated_m = minutes_formatting(minutes) - new_min

    Clock.new(updated_h, updated_m)
  end

  def ==(second_t)
    hour == second_t.hour && minutes == second_t.minutes
  end

  def to_s
    "#{"%02d" % hour}:#{"%02d" % minutes}"
  end
end

#p Clock.at(10) + 3
# p Clock.at(0) - 50
# p Clock.at(10) + 3061
# p Clock.at(10, 30) - 5
# p Clock.at(0) - 50
# p Clock.at(10) - 90
# p Clock.at(10) - 3061