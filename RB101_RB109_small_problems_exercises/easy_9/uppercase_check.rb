=begin
Write a method that takes a string argument, and returns true if all of the alphabetic characters 
inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

*** Understand the Problem ***
-Input: string
-Output: boolean
-Rules:
  -return true if all alphabetic characters in input string are uppercase, else return false
  -non-alphabetic characters (e.g. punctuation or whitespace) should be ignored

*** Data Structures ***
-Input: string
-Output: boolean

*** Algorithm ***
-delete from the string any non-alphabetic characters
-split string into array of individual characters, and call #all? 
  -check if each character is uppercase
=end

def uppercase?(str)
  str.delete("^a-zA-Z").chars.all? { |char| char =~ /[A-Z]/ }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Further Exploration
def uppercase2?(str)
  str == str.upcase && !str.empty?
end

p uppercase2?('') == false
