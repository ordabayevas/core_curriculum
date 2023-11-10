# question 3
# my solution
advice = "Few things in life are as important as house training your pet dinosaur."
new_advice = advice.split(' ')
new_advice[6] = 'urgent'

p new_advice.join(' ')

#LS solution
advice.gsub!('important', 'urgent')