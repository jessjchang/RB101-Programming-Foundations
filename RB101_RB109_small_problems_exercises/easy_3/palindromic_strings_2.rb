=begin
Write another method that returns true if the string passed as an argument is a palindrome, 
false otherwise. This time, however, your method should be case-insensitive, 
and it should ignore all non-alphanumeric characters. 
If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

*** Understand the Problem ***
-input: string
-output: boolean
  -true if given string is a palindrome, else false
-Rules:
  -palindrome reads the same forward and backward
  -case-insensitive, so 'M' should be treated the same as 'm'
  -any non-alphanumeric characters don't matter (i.e. punctuation marks/spaces) - only letters 'a' through 'z' count

*** Algorithm ***
-define method named real_palindrome? that takes one parameter, a string
-downcase the string
-iterate through string and delete any characters that are non-alphanumeric
-call palindrome? method on the string
=end

ALPHANUMERIC_CHARS = ('a'..'z').to_a + ('0'..'9').to_a

def palindrome?(string)
  string.reverse == string
end

def real_palindrome?(string)
  string.downcase!
  string.each_char { |char| string.gsub!(char, '') if !ALPHANUMERIC_CHARS.include?(char) }
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false