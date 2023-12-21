flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# my solution
flintstones.push('Dino', 'Hoppy')
p flintstones

# LS solutions
flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item
flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain