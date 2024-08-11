def step(started, ended, step)
  value = started
  while value <= ended
    yield(value)
    value += step
  end
  value
end

step(1, 10, 3) { |value| puts "value = #{value}" }