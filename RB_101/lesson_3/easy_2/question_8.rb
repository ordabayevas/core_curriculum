advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice(/F.*as/) #  Non-mutating version
p advice

p advice.slice!(/F.*as/) # Mutates
p advice

# LS solution
advice.slice!(0, advice.index('house'))  # => "Few things in life are as important as "
p advice # => "house training your pet dinosaur."