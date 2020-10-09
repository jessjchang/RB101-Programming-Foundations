=begin
Write a method that takes an array of strings, and returns an array of the same string values, 
except with the vowels (a, e, i, o, u) removed.

*** Understand the Problem ***
-Input: array of strings
-Output: array of strings with vowels from the given array removed
-Rules: 
  -vowels include 'aeiou', both uppercase and lowercase
  -if string consists of entirely vowels, output array will replace with an empty string
  -case sensitive, so whatever case the character in input is, output will maintain the case
  -input array can be of any size - output array will always be of the same size as input array

*** Data Structures ***
-Input: array of strings
-Output: array of strings

*** Algorithm ***
-set constant vowel array of lowercase vowels
-initialize empty array object to store each resulting string
-iterate through the given array
  -for each string in the array, iterate through each character of the string 
    -initialize empty string variable to store the modified string
    -if vowel array does not contain the character.downcase, add to the empty string
  -once all characters have been iterated through, add the once-empty string to the empty array and 
  move onto the next string in the original array
-return the resulting array
=end

VOWELS = %w(a e i o u)

def remove_vowels(array)
  array.each_with_object([]) do |string, result_array|
    devoweled_string = ''
    string.each_char do |char|
      devoweled_string << char if !VOWELS.include?(char.downcase)
    end
    result_array << devoweled_string
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']