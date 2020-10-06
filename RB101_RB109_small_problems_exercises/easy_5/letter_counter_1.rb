=begin
Write a method that takes a string with one or more space separated words and returns a hash 
that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

*** Understand the Problem ***
-input: string
-output: hash
  -count of how many different-sized words in the given string
-Rules:
  -spaces don't count as a character within the word
  -punctuation counts as a character within the word
  -if given string is empty, return an empty hash

*** Data Structure ***
-input: string
-output: hash
-use array to iterate through without having to deal with spaces

*** Algorithm ***
-initialize empty hash
-split the string on spaces
-iterate through string_array
  -for each word, find length
    -if hash.has_key?(length)
      -hash[length] += 1
    -otherwise,
      -hash[length] = 1
-return hash
=end

def word_sizes(string)
  counts = Hash.new(0)
  word_array = string.split
  word_array.each do |word|
    word_length = word.length
    counts[word_length] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}