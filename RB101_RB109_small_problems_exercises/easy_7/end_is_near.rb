=begin
Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

*** Understand the Problem ***
-Input: string
-Output: string
  -the second to last word in the input string
-Rules:
  -input string will always contain 2 words or more
  -a "word" is any sequence of characters separated by a space

*** Data Structures ***
-Input: string
-Output: string

*** Algorithm ***
-split the string on spaces into an array
-return array[-2]
=end

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Further Exploration
def find_middle_word(str)
  words = str.split
  if words.empty?
    ''
  elsif words.size == 1
    words[0]
  elsif words.size.even?
    "#{words[(words.size / 2) - 1]} #{words[(words.size / 2)]}"
  else
    words[words.size / 2]
  end 
end

p find_middle_word('last word') == 'last word' # if string contains even number of words, return both middle words
p find_middle_word('Launch School is great!') == 'School is' 
p find_middle_word('Launch School is so great!') == 'is' 
p find_middle_word('') == '' # if string is empty, return empty string
p find_middle_word(' ') == '' # if string is not empty but contains only blank spaces, return empty string
p find_middle_word('last') == 'last' # if string contains one word, return the word


