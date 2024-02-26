# Pete, the baker
=begin
Pete likes to bake some cakes. He has some recipes and ingredients. 
Unfortunately he is not good in maths. Can you help him to find out, 
how many cakes he could bake considering his recipes?

Write a function cakes(), which takes the recipe (object) and the available 
ingredients (also an object) and returns the maximum number of cakes Pete can bake 
(integer). For simplicity there are no units for the amounts 
(e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). 
Ingredients that are not present in the objects, can be considered as 0.

Examples:

// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); 
=end

# P
# Input: 2 hashes
# Output: integer, the total num of cakes
# Rules:
# - first hash is the recipe
# - second is the available products
# - products and recipe do not have any units
# - return the number of total cakes from available products
# - if there are no enough available product, return 0
# - if some ingredient is in a recipe and is not in available products, default product to 0

# E
=begin
{"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}
flour -> recipe: 500
      -> available: 1200 (1200 / 500 = 2)
sugar -> recipe: 200
      -> available: 1200 (1200 / 200 = 6)
eggs  -> recipe: 1
      -> available: 5 (5 / 1 = 5)
Ignore other available products.
Return the smallest num from all 3 ingredients which is 2.

{"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},
{"sugar"=>500, "flour"=>2000, "milk"=>2000}
apples -> recipe: 3
       -> available: 0 (0 / 3 = 0) 
if some of the ingredients are return 0 available, return 0
=end

# D
# Hash and array.

# A
=begin
- FIND a first ingredient in the second hash
  - iterate over the first hash
    - iterate with #each and key value pair
  - check if first hashes elements in the second
    - if every key is #included to a second
    - take values of the same keys
    - else: return 0
- RETURN the num of cakes from current ingredient
  - divide the value in the second hash by value of the first
    quotient = hash2[key] / hash1[key]
- SORT the nums of cakes from each ingredient
  - add all quotients to a new empty array
    - quotients = [] << quotient
  - sort the order from the smallest to the largest
    - quotients.sort
- RETURN the smallest num
  - return the first num in sorted array
    - quotients[0]
=end

# C
def cakes(recipe, products)
  quotients = []
  recipe.each do |key, value|
    if products.include?(key)
      quotient = products[key] / value
      quotients << quotient
    else
      return 0
    end
  end

  quotients.sort[0]
end



p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1
