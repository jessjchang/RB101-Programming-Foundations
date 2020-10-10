=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: 
one represents the number of characters in the string that are lowercase letters, 
one the number of characters that are uppercase letters, and one the number of characters that are neither.

*** Understand the Problem ***
-Input: string
-Output: hash
  -3 entries:
    -key 'lowercase', value will be # of characters in the string that are lowercase letters
    -key 'uppercase', value will be # of characters in string that are uppercase letters
    -key 'neither', value will be # of characters that are neither upper nor lowercase letters
-Rules:
  -if string is empty, values of all 3 key entries in returned hash will be 0
  -spaces count as a 'neither' character

*** Data Structures ***
-Input: string
-Output: hash

*** Algorithm ***
-initialize 2 constant arrays: lowercase letter array, uppercase letter array
-initialize hash: { lowercase: 0, uppercase: 0, neither: 0 }
-iterate through each character of the string
  -if lowercase letter array contains the character, then increment 'lowercase' value in hash by 1
  -if uppercase letter array contains the character, then increment 'uppercase' value in hash by 1
  -else, increment 'neither' value in hash by 1
-return the hash
=end

LOWERCASE_LETTERS = ('a'..'z').to_a
UPPERCASE_LETTERS = ('A'..'Z').to_a

def letter_case_count(str)
  results_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str.each_char do |char|
    if LOWERCASE_LETTERS.include?(char)
      results_hash[:lowercase] += 1
    elsif UPPERCASE_LETTERS.include?(char)
      results_hash[:uppercase] += 1
    else
      results_hash[:neither] += 1
    end
  end
  results_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }