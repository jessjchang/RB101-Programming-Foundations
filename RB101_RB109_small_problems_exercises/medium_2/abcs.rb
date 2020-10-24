=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from 
any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, 
false otherwise.

*** Understand the Problem ***
-Input: string
-Output: boolean
-Rules:
  -case-insensitive, input string characters can be lowercase and still treated same as uppercase version of
  the letter
  -determine whether the input word can be spelled with the above set of blocks
  -each block can only be used once, and only one letter from each block can be used
-Questions:
  -will input always be a single word? Otherwise, if spaces, should they be ignored?
  -will input always only contain letters?

*** Data Structures ***
-Input: string
-Output: boolean
-array

*** Algorithm ***
-initialize a constant nested array to represent the set of blocks
-split the input string into an array of separate characters and uppercase all letters
-iterate through this nested array
  -for each sub-array, if only one of the letters is included in the character array, delete it from the
  character array and move onto the next iteration
  -if both letters in the sub-array are included in the character array, return false
-return true at the very end if character array is empty
=end

BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'],
         ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(word)
  word_arr = word.chars.map(&:upcase)
  BLOCKS.each do |block|
    if word_arr.include?(block.first) && !word_arr.include?(block.last)
      word_arr.delete(block.first)
    elsif word_arr.include?(block.last) && !word_arr.include?(block.first)
      word_arr.delete(block.last)
    elsif word_arr.include?(block.first) && word_arr.include?(block.last)
      return false
    end
  end
  return true if word_arr.empty?
  false
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true