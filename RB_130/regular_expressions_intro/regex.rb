# p "cat".scan(/^c.t/i)          # ["cat"]
# p "cot\n".scan(/^c.t/i)        # ["cot"]
# p "CATASTROPHE".scan(/^c.t/i)  # ["CAT"]
# p "WILDCAUGHT".scan(/^c.t/i)   # []
# p "wildcat\n".scan(/^c.t/i)    # []
# p "-CET-".scan(/^c.t/i)        # []
# p "Yacht".scan(/^c.t/i) 

# p "cat".scan(/c.t$/i)          # ["cat"]
# p "cot\n".scan(/c.t$/i)        # ["cot"]
# p "CATASTROPHE".scan(/c.t$/i)  # []
# p "WILDCAUGHT".scan(/c.t$/i)   # []
# p "wildcat\n".scan(/c.t$/i)    # ["cat"]
# p "-CET-".scan(/c.t$/i)        # []
# p "Yacht".scan(/c.t$/i)

# text = "cat\ncot\nCATASTROPHE\nWILDCAUGHT\n" +
#        "wildcat\n-GET-\nYacht"

# p text.scan(/^c.t/i) # ["cat", "cot", "CAT"]
# p text.scan(/c.t$/i) # ["cat", "cot", "cat", "cht"]

text = "cat\ncot\nCATASTROPHE\nWILDCAUGHT\n" +
       "wildcat\n-GET-\nYacht"

p text.scan(/\Ac.t/i) # ["cat"]
p text.scan(/c.t\z/i) # ["cht"]