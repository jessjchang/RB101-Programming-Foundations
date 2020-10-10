=begin
Write a method that takes a String as an argument, and returns a new String that contains the original value 
using a staggered capitalization scheme in which every other character is capitalized, 
and the remaining characters are lowercase. Characters that are not letters should not be changed, 
but count as characters when switching between upper and lowercase.

*** Understand the Problem ***
-Input: string
-Output: new string
-Rules:
  -output string will stagger capitalization within argument string
  -every other character will be capitalized, starting with the first character as a capitalized character
  -non-alphabetic characters shouldn't be changed, but count as characters when counting "every other character"

*** Data Structures ***
-Input: string
-Output: string

*** Algorithm ***
-initialize empty string to store each transformed character as results string
-iterate through each character of the argument string with index
  -if the index is even, call #upcase on the character and add to the results string
  -if the index is odd, call #downcase on the character and add to results string
-return the results string
=end

def staggered_case(str)
  staggered_string = ''
  str.each_char.with_index do |char, index|
    if index.even?
      staggered_string << char.upcase
    else
      staggered_string << char.downcase
    end
  end
  staggered_string
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Further Exploration
def staggered_case2(string, starting_case='upcase')
  result = ''
  case starting_case
  when 'upcase'
    need_upper = true
  when 'downcase'
    need_upper = false
  end
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS', 'downcase') == 'aLl_cApS'
p staggered_case2('ignore 77 the 444 numbers', 'upcase') == 'IgNoRe 77 ThE 444 NuMbErS'
