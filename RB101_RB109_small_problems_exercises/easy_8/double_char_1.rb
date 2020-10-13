=begin
Write a method that takes a string, and returns a new string in which every character is doubled.

*** Understand the Problem ***
-Input: string
-Output: new string
-Rules:
  -output string will double every character of input string
  -case sensitive e.g. case of input string will remain when doubled in output string
  -if input string is empty, return an empty output string
  -non-alphabetic characters, including punctuation and blank spaces, also count as characters to be doubled

*** Data Structures ***
-Input: string
-Output: string

*** Algorithm ***
-initialize empty output string
-iterate through each character of input string
  -multiply the character by 2 and append it to the output string
-return output string
=end

def repeater(str)
  str.each_char.with_object('') { |char, doubled_str| doubled_str << (char * 2) }
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''