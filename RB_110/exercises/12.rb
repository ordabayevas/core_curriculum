# Extract the domain name from a URL

=begin
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:

domain_name("http://github.com/carbonfive/raygun") == "github" 
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"
=end

# P
# Input: string
# Output: extracted name string

# E
# domain_name("http://github.com/carbonfive/raygun") == "github" 
# domain_name("http://www.zombie-bites.com") == "zombie-bites"
# domain_name("https://www.cnet.com") == "cnet"

# D
# Use stirng to cut off unnecessary parts of URL

# A
# - write a method that takes 1 string
# - if string has 'http', then slice it from string
# - if string has 'https', then slice it from string
# - if string has '://', then slice it from string
# - if string has 'www.', then slice it from string
# - take a cutted, modified string and split it by '.'
# - return the first element from splitted array

# C
def domain_name(url)
  url.slice!('https')
  url.slice!('http')
  url.slice!('://')
  url.slice!('www.')
  url.split('.')[0]
end

p domain_name("http://github.com/carbonfive/raygun") == "github" 
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("https://www.cnet.com") == "cnet"

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"

# Codewars solution
# def domain_name(url)
#   regex = /(http|https):\/\/(?:www\.)?(?<domain_name>.*?)\./
#   url.match(regex)[:domain_name]
# end
