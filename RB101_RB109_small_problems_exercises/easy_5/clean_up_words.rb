=begin
Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, 
write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
If one or more non-alphabetic characters occur in a row, you should only have one space in the result 
(the result should never have consecutive spaces).

*** Understand the Problem ***
-Input: string of words
-Output: string of words
-Rules:
  -given string will always consist of only lowercased letters/non-alphabetic characters/spaces - don't need to worry about case sensitivity
  -output string will replace space for any non-alphabetic characters
    -if more than one non-alphabetic character consecutively in provided string, output string will only replace with one space

*** Data Structure ***
-input: string
-output: string
-use array to look up alphabetic characters

*** Algorithm ***
-set constant array of lowercase alphabetic characters
-set empty string to store final result
-set index to 0
-iterate through each character of the string while index < string.length
  -if character is included in alphabet array, 
    -push it into the empty_string
  -otherwise, 
    -if index == 0, push a space into the empty_string
    -push a space into the empty_string if previous character was alphabetic
  -increment index
-return empty_string
=end

ALPHABETIC_CHARS = ('a'..'z').to_a

def cleanup(string)
  final_string = ''
  index = 0
  while index < string.length
    if ALPHABETIC_CHARS.include?(string[index])
      final_string << string[index]
    else
      final_string << ' ' if index == 0 || ALPHABETIC_CHARS.include?(string[index - 1])
    end
    index += 1
  end
  final_string
end

p cleanup("---what's my +*& line?") == ' what s my line '