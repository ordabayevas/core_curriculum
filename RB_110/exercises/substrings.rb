# find all substrings of string 
# string = 'abcdefghijk'
# new = []
# count = string.size

# string.size.times do |start_i|
#   1.upto(count) do |length|
#     new << string[start_i, length]
#   end

#   count -= 1
# end
# p new

# def all_substrings(string)
#   subs = []
#   max = string.size
#   string.size.times do |start_i| # 10.times do |0, 1, 2, 3, 4, 5, 6, 7, 8, 9|
#     1.upto(max) do |length| # iterates from 1 to 10
#       subs << string[start_i, length] # 0, 1
#     end

#     max -= 1
#   end
#   subs
# endx


def substrings(string)
  subs = []
  max_range = string.size

  string.size.times do |start_idx|
    1.upto(max_range) do |length|
      p length
      subs << string[start_idx, length]
    end

    max_range -= 1
  end
  subs
end
p substrings('abc')




    


