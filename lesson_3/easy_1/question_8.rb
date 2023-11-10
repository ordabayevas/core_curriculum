flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# my solution
key = flintstones.key(2)
value = flintstones["Barney"]

array = ["#{key}", "#{value}"]
p array # => ["Barney", 2]

# LS solution
flintstones.assoc("Barney") #=> ["Barney", 2] If the given key is found, returns a 2-element Array containing that key and its value.