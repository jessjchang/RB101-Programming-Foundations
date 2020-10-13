=begin
Write a method that takes a non-empty string argument, and returns the middle character or characters of 
the argument. If the argument has an odd length, you should return exactly one character. 
If the argument has an even length, you should return exactly two characters.

*** Understand the Problem ***
-Input: string
-Output: string
-Rules:
  -output string will be middle character or characters of the argument string
  -if input string has odd length, return 1-character output string
    -index of middle character is at input string's length / 2
  -if input string has even length, return 2-character output string
    -index of middle characters is input string's length / 2 - 1 and input string's length / 2
  -all characters, including whitespace, count as characters

*** Data Structures ***
-Input: string
-Output: string

*** Algorithm ***
-calculate input string's length
-if odd, then return character at index input string's length / 2
-if even, then return characters at index input string's length / 2 - 1 + input string's length / 2
=end

def center_of(str)
  str_length = str.length
  if str_length.odd?
    str[str.length / 2]
  else
    str[(str.length / 2) - 1] + str[str.length / 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'