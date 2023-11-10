ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# 1
puts ages.has_key?("Spot")
# 2
puts ages.include?("Spot")
# 3
puts ages.member?("Spot")