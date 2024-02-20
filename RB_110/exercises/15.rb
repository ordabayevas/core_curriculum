# Dubstep
=begin
Polycarpus works as a DJ in the best Berland nightclub, and he often uses dubstep 
music in his performance. Recently, he has decided to take a couple of old songs 
and make dubstep remixes from them.

Let's assume that a song consists of some number of words (that don't contain WUB). 
To make the dubstep remix of this song, Polycarpus inserts a certain number of words 
"WUB" before the first word of the song (the number may be zero), after the last word 
(the number may be zero), and between words (at least one between any pair of 
neighbouring words), and then the boy glues together all the words, including "WUB", 
in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep remix as 
"WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into 
modern music, he decided to find out what was the initial song that Polycarpus remixed. 
Help Jonny restore the original song.
=end

# P
# Input:
# The input consists of a single non-empty string, consisting only of uppercase 
# English letters, the string's length doesn't exceed 200 characters

# Output:
# Return the words of the initial song that Polycarpus used to make a dubsteb remix. 
# Separate the words with a space.

# E
# song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")  =>  WE ARE THE CHAMPIONS MY FRIEND

# D
# Convert into array to split the words and contain them.

# A
# - write a method with 1 string
# - split the words by "WUB"
# - iterate over array with strings
# - remove if string is empty
# - concatenate the words by space

# C
def song_decoder(string)
  arr_of_words = string.split('WUB')
  result = arr_of_words.select do |word|
    !word.empty?
  end

  result.join(' ')
end

p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")

p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
