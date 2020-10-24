=begin
Write a method that takes a string as argument, and returns true if all parentheses in the string are 
properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' 
pairs.

Note that balanced pairs must each start with a (, not a ).

*** Understand the Problem ***
-Input: string
-Output: boolean
-Rules:
  -balanced pair means if there are any parentheses symbols (either '(' or ')') in the given string:
    -'(' must precede a ')', and there will be an equal number of both symbols i.e. for each '(' there is a
    corresponding ')'
    -or, neither symbol exists in the string

*** Data Structures ***
-Input: string
-Output: boolean
-integer to count

*** Algorithm ***
-initialize count of '(' as 0
-initialize count of ')' as 0
-iterate through the string
  -if encounter '(' or ')' increment the corresponding variable count
  -if they symbol is a ')' and count of ')' > count of '(', then return false, as it means ')' is preceding 
  '(' in the string
-if count of '(' == ')' then return true
=end

def balanced?(str)
  open_paren_count = 0
  closed_paren_count = 0
  str.chars.each do |char|
    if char == '('
      open_paren_count += 1
    elsif char == ')'
      closed_paren_count += 1
    end
    return false if char == ')' && closed_paren_count > open_paren_count
  end
  return true if open_paren_count == closed_paren_count
  false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# Further Exploration
OPENING = ['(', '[', '{']
CLOSING = [')', ']', '}']
QUOTES = ['\'', '"']

def balanced2?(str)
  count_parens = 0
  count_quotes = 0
  str.each_char do |char|
    if OPENING.include?(char)
      count_parens += 1
    elsif CLOSING.include?(char)
      count_parens -= 1
    elsif QUOTES.include?(char)
      count_quotes += 1
    end
    break if count_parens < 0
  end
  count_parens.zero? && count_quotes.even?
end

p balanced2?("What '(is) this?") == false
p balanced2?('What is) [this?') == false
p balanced2?('What (is this?') == false
p balanced2?('({What} (is this))?') == true
p balanced2?('((What]) (is this))?') == false
p balanced2?("'Hey!'") == true
