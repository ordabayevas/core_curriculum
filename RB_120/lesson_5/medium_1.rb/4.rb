class CircularBuffer
  attr_reader :buffer

  def initialize(size)
    @buffer = Array.new(3)
    @oldest_index = 0
  end

  def get
    value = @buffer[@oldest_index]
    @buffer[@oldest_index] = nil
    next_oldest_index = (@oldest_index + 1).remainder(3)
    if @buffer[next_oldest_index] != nil
      @oldest_index = next_oldest_index
    elsif @buffer.all?(nil)
      @oldest_index = 0
    end
    value
  end

  def put(num)
    if !@buffer.include?(nil)
      get
    end

    3.times do |index|
      new_index = (index + @oldest_index).remainder(3)
      if @buffer[new_index] == nil
        @buffer[new_index] = num
        break
      end
    end
  end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
# p buffer.get #== 4
p buffer.get == 5
p buffer.get == 6
p buffer.get == 7
puts buffer.get == nil