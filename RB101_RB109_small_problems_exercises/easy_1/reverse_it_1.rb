=begin
Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Examples:
puts reverse_sentence('') == '' 
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

Expected output:
true
true
true

*** Understand the problem ***
-write method named reverse_sentence
-input:
  -pass in one argument, a string
-output:
  -new string with words in reverse order 
  -e.g. if split string into array of separate words, then for an array of 5 elements:
    -array[0] => array[4] 
    -array[1] => array[3]
    -array[2] => array[2]
    -array[3] => array[1]
    -array[4] => array[0]
  -array of n elements (array of size n):
    -array[index] => array[n-index-1]
-rules:
  -if empty string is passed in, empty string will be the output
  -if one word passed in, the word will be the output
  -what if punctuation is included in the string? 

*** Additional Examples/Test Cases ***
puts reverse_sentence('Hello') == 'Hello'
puts reverse_sentence('Hello, World') == 'World Hello,''
  -what should happen in the case of punctuation - are we still considering each "word" to be any sequence
  of characters separated by space?

*** Data structures ***
-input is a string
-convert input string to array
-output is a string

*** Algorithm ***
1. define method with one parameter, a string
2. convert string to an array using #split method with spaces as delimiters
3. create a new empty array
3. iterate through the words array
  -for each element, add it to the front of the empty array
4. join the array with space between each element
=end

# *** CODE ***
def reverse_sentence(string)
  split_string = string.split(' ')
  reversed_array = []
  split_string.each do |word|
    reversed_array.unshift(word)
  end
  reversed_array.join(' ')
end

puts reverse_sentence('') == '' 
puts reverse_sentence('Hello') == 'Hello'
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('Hello, World') == 'World Hello,'