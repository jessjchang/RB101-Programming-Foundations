# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
*** Understand the Problem ***
-input: string
-output: array of substrings
-Rules:
  -each element of resulting array will be a substring of the given string, as well as a palindrome
  -palindrome is a word that reads the same forwards and backwards
  -palindromes are case sensitive ('aba' is a palindrome, but 'Aba' is not)
  -if given string is empty, result should be an empty array
  -if there are no substrings that are palindromes, result should be an empty array
-Questions for interviewer:
  -confirm definition of substring, palindrome, and case sensitivity
  -does order of the elements in the resulting array matter?
  -given string will never have spaces or non-alphabetic characters?
=end