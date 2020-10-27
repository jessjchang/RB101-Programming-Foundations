=begin
We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all 
of them. What exactly happens?
When we used #each to iterate through the words array, we ended up modifying the array as we are iterating 
through it, so we skip over one of the words when we deleted the previous one.
=end

def neutralize(sentence)
  words = sentence.split(' ')
  words.reject!{ |word| negative?(word) }

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.