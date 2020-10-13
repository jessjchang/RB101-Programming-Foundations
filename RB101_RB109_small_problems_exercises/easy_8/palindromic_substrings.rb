=begin
Write a method that returns a list of all substrings of a string that are palindromic. 
That is, each substring must consist of the same sequence of characters forwards as it does backwards. 
The return value should be arranged in the same sequence as the substrings appear in the string. 
Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; 
that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that 
single characters are not palindromes.

*** Understand the Problem ***
-Input: string
-Output: array of substrings
-Rules:
  -use substrings method from previous exercise
  -output array will contain all palindromic substrings of input string
    -will be arranged in same sequence as the substrings appear in the string
    -duplicate palindromic substrings should be included
  -definition of palindrome: reads the same forwards and backwards
  -case-sensitive and all characters (including non-alphabetic/blanks) should be considered
    -'AbcbA' is a palindrome, but 'Abcba' and 'Abc-bA' are not
  -if input string is a single character, it is not considered a palindrome
  -if input string does not contain any palindromic substrings, return an empty array

*** Data Structures ***
-Input: string
-Output: array

*** Algorithm ***
-initialize empty array to store palindromic substrings
-call substrings method on input string to return an array of all the substrings
-iterate through the substrings array
  -if element is just one character, then move onto the next iteration as it's not considered a palindrome
  -if element == element.reverse
    -add it to your palindromic_substrings_array
-return palindromic_substrings_array
=end

def leading_substrings(str)
  substrings = []
  1.upto(str.length) do |counter|
    substrings << str[0, counter]
  end
  substrings
end

def substrings(str)
  all_substrings = []
  str.length.times do 
    leading_substrings(str).each { |substring| all_substrings << substring }
    str.slice!(0)
  end
  all_substrings
end

def palindromes(str)
  palindromes = []
  (substrings(str)).each do |substring|
    if substring.size == 1
      next
    elsif substring == substring.reverse
      palindromes << substring
    end
  end
  palindromes
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p (palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
])
p (palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
])

# Further Exploration - ignore non-alphanumeric characters and case

def palindromes2(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string = string.downcase.gsub(/[^a-z0-9]/i, '')
  string.downcase == string.downcase.reverse && string.size > 1
end

p palindromes2('abcd') == []
p palindromes2('madam') == ['madam', 'ada']
p palindromes2('Madam') == ['Madam', 'ada']
p palindromes2('- 7Mad-am7 -') == ["- 7Mad-am7", "- 7Mad-am7 ", "- 7Mad-am7 -", " 7Mad-am7", " 7Mad-am7 ", " 7Mad-am7 -", "7Mad-am7", "7Mad-am7 ", "7Mad-am7 -", "Mad-am", "ad-a"]
