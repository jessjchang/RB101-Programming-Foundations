=begin
Write a method that returns true if the string passed as an argument is a palindrome, 
false otherwise. A palindrome reads the same forward and backward. 
For this exercise, case matters as does punctuation and spaces.

*** Understand the Problem ***
-Input: string
-Output: boolean
  -true if given string is a palindrome, else false
-Rules:
  -a palindrome reads the same forward and backward
  -case sensitive, e.g. 'm' is not the same as 'M'
  -punctuation and space characters all matter

*** Data structures ***
-input: string
-output: boolean

*** Algorithm ***
-define method named palindrome? that takes one parameter, a string
-can use String#reverse method - if the reverse of the string is equal to the string itself, then return true

=end

def palindrome?(string)
  string.reverse == string
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Further Exploration 1 - palindromic array
def palindromic_array?(array)
  array.reverse == array
end

p palindromic_array?(['a', 'b', 'c', 'b', 'a']) == true
p palindromic_array?(['A', 'b', 'c', 'b', 'a']) == false
p palindromic_array?(['a', 'b', 'c', '.', 'b', 'a']) == false
p palindromic_array?([3, 5, 6, 6, 5, 3]) == true

# Further Exploration 2 - palindromic string or array
def palindromic?(input)
  input.reverse == input
end

p palindromic?('madam') == true
p palindromic?('Madam') == false          
p palindromic?("madam i'm adam") == false 
p palindromic?('356653') == true
p palindromic?(['a', 'b', 'c', 'b', 'a']) == true
p palindromic?(['A', 'b', 'c', 'b', 'a']) == false
p palindromic?(['a', 'b', 'c', '.', 'b', 'a']) == false
p palindromic?([3, 5, 6, 6, 5, 3]) == true

