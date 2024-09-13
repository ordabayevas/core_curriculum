# 1. URL match
# def url?(string_url)
#   url = /\Ahttps?:\/\/\S+\z/
#   url.match?(string_url)
# end

# p url?('https://launchschool.com')     # -> true
# p url?('http://example.com')           # -> true
# p url?('https://example.com hello')    # -> false
# p url?('   https://example.com')       # -> false

# 2. Split string
# def fields(string)
#   string.split(/[ \t,]+/)
# end

# p fields("Pete,201,Student")     # ["Pete", "201", "Student"]
# p fields("Pete \t 201   ,  TA")  # ["Pete", "201", "TA"]
# p fields("Pete \t 201")          # ["Pete", "201"]
# p fields("Pete \n 201")          # ["Pete", "\n", "201"]

# 3. First string replacement
# def mystery_math(string_expression)
#   string_expression.sub(/[\+\-\*\/]/, '?')
# end

# p mystery_math('4 + 3 - 5 = 2')
# # '4 ? 3 - 5 = 2'

# p mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# # '(4 ? 3 + 2) / 7 - 1 = 1'

# 4. All string match replacement
# def mysterious_math(string_expression)
#   string_expression.gsub(/[+\-\*\/]/, '?')
# end

# p mysterious_math('4 + 3 - 5 = 2')
# # '4 ? 3 ? 5 = 2'
# p mysterious_math('(4 * 3 + 2) / 7 - 1 = 1')
# # '(4 ? 3 ? 2) ? 7 ? 1 = 1'

# 5. Word replacement
def danish(string)
  string.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end

p danish('An apple a day keeps the doctor away')
# -> 'An danish a day keeps the doctor away'

p danish('My favorite is blueberry pie')
# -> 'My favorite is danish pie'

p danish('The cherry of my eye')
# -> 'The danish of my eye'

p danish('apple. cherry. blueberry.')
# -> 'danish. cherry. blueberry.'

p danish('I love pineapple')
# -> 'I love pineapple'