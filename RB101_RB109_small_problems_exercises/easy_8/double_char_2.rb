=begin
Write a method that takes a string, and returns a new string in which every consonant character is doubled. 
Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

*** Understand the Problem ***
-Input: string
-Output: new string
-Rules:
  -output string will double every consonant character
  -definition of consonant: any alphabetic character that is not a vowel (a,e,i,o,u), numeric digit, punctuation,
  or whitespace
  -if input string is empty, return an empty output string 

*** Data Structures ***
-Input: string
-Output: string

*** Algorithm ***
-initialize empty output string
-iterate through input string
  -if character is an alphabetic character that is not a vowel, then add 2 * character to the output string
  -else, add the character to the output string
-return output string
=end

def double_consonants(str)
  str.each_char.with_object('') do |char, result|
    if char =~ /[a-z&&[^aeiou]]/i
      result << (char * 2)
    else
      result << char
    end
  end
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""