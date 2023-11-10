advice = "Few things in life are as important as house training your pet dinosaur."

# 1
p advice.include?('dino')
# 2
p advice.match?('dino') # Note that this is not a perfect solution, as it would match any substring with Dino in it.