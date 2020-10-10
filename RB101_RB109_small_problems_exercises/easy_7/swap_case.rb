=begin
Write a method that takes a string as an argument and returns a new string in which every uppercase letter 
is replaced by its lowercase version, and every lowercase letter by its uppercase version. 
All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

*** Understand the Problem ***
-Input: string
-Output: new string
-Rules:
  -output string will replace all uppercase letters in argument string with lowercase, and vice versa
  -spaces and non-alphabetic characters will remain as-is in new string

*** Data Structures ***
-Input: string
-Output: string

*** Algorithm ***
-initialize uppercase_letter array and lower_case letter array
-initialize empty string
-iterate through each character of the argument string
  -if uppercase_letter array includes the character, then call #downcase and add to the empty string
  -if lowercase_letter array includes the character, then call #upcase and add to the empty string
  -else, add the character to the string
-return the results string
=end

UPPERCASE_LETTERS = ('A'..'Z').to_a
LOWERCASE_LETTERS = ('a'..'z').to_a

def swapcase(str)
  swapped_string = ''
  str.each_char do |char|
    if UPPERCASE_LETTERS.include?(char)
      swapped_string << char.downcase
    elsif LOWERCASE_LETTERS.include?(char)
      swapped_string << char.upcase
    else
      swapped_string << char
    end
  end
  swapped_string
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'