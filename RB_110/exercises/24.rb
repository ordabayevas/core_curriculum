# def longest_palindrome(str) # supertacocat
#   # CREATE  
#   substrings = []
#   max_range = str.size # 12

#   str.size.times do |start_idx| # 12.times do |0| |1|
#     1.upto(max_range) do |range| # 1.upto(12) do |1| |2|
#       substrings << str[start_idx, range] # [] << supertacocat[0, 1] [0, 2] [0, 3]
#     end
#     # 's', 'su', 'sup'
#     max_range -= 1 # 11
#   end

#   # SELECT
#   substrings.select! do |substr|
#     (substr.downcase == substr.downcase.reverse) && (substr.size > 1)
#   end
  
#   # TRANSFORM
#   substrings.map!(&:size)

#   # RETURN
#   substrings.empty? ? -1 : substrings.max
# end


# all_substrings
# def substrings(string) # MomAndDad
#   arr = []
#   max_length = string.length

#   string.length.times do |index|
#     1.upto(max_length) do |length|
#       arr << string[index, length]
#     end

#     max_length -= 1
#   end

#   arr
# end

# p substrings('MomAndDad')
