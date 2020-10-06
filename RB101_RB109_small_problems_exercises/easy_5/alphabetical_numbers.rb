=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers 
sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, 
fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

*** Understand the Problem ***
-input: array of integers between 0 and 19
-output: array of integers sorted based on English words for each number sorted alphabetically

*** Data Structure ***
-input: array
-output: array
-hash to look up English words for each integer

*** Algorithm ***
-set up hash - key: integer, value: English word for the integer
-initialize empty array to store English words
-iterate through the given array
  -for each integer, look up its English word equivalent in the hash table
  -add the English word to your array
-sort the array
-iterate through the array using map and look up using Hash#key the corresponding integer value
=end

INT_TO_WORD = (0..19).zip(['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 
'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']).to_h

def alphabetic_number_sort(int_array)
  word_array = []
  int_array.each { |int| word_array << INT_TO_WORD[int] }
  word_array.sort.map { |word| INT_TO_WORD.key(word) }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]