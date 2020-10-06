=begin
Given a string of words separated by spaces, write a method that takes this string of words 
and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain 
at least one word. You may also assume that each string contains nothing but words and spaces

*** Understand the Problem ***
-Input: string of words separated by spaces
-Output: string
  -maintain the spaces from the original string
  -swap first and last letter of each word in given string
  -case sensitive
  -don't have to account for empty strings or characters other than words/spaces

*** Data Structure ***
-input: string
-output: string
-use array to store result

*** Algorithm ***
-initialize empty array to store words
-split the given string on spaces
-iterate through the string_array
  -initialize empty string to store resulting word
  -set index = 0
  -while index < word.length
    -empty_string << word[-1] if index == 0
    -otherwise, empty_string << word[0] if index == word.length - 1
    -otherwise, empty_string << word[index]
    index += 1
  -push empty_string into empty_array
-join empty_array with spaces
=end

def swap(string)
  swapped_array = []
  string_array = string.split
  string_array.each do |word|
    swapped_word = ''
    index = 0
    while index < word.length
      if index == 0
        swapped_word << word[-1]
      elsif index == word.length - 1
        swapped_word << word[0]
      else
        swapped_word << word[index]
      end
      index += 1
    end
    swapped_array << swapped_word
  end
  swapped_array.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'