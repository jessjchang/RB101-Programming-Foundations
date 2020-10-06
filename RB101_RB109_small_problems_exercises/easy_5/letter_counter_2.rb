=begin
Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. 
For instance, the length of "it's" is 3, not 4.

*** Understand the Problem ***
-input: string
-output: hash 
-Rules:
  -spaces and non-alphabetic characters don't count as characters in word

*** Data Structure ***
-input: string
-output: hash
-use array to split string on spaces

*** Algorithm ***
-set constant array of alphabetic characters
-initialize a new empty hash with default value 0
-split string on spaces
-iterate through the string_array
  -initialize empty string = ''
  -iterate through each character of the word
    -if character.downcase is included in the alphabet array, then add it to empty_string
  -take length of the empty_string, and the increment its value by 1 in the hash
-return hash
=end

ALPHABETIC_CHARS = ('a'..'z').to_a

def word_sizes(string)
  counts = Hash.new(0)
  word_array = string.split
  word_array.each do |word|
    word_to_count = ''
    word.each_char { |char| word_to_count << char if ALPHABETIC_CHARS.include?(char.downcase) }
    counts[word_to_count.length] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}