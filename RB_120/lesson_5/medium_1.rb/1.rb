class Machine

  def start
    flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def show_switch
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

auto = Machine.new
puts auto.start
puts auto.show_switch
