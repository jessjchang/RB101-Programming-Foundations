=begin
Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether 
it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the 
return value; they just don't count when toggling the desired case.

*** Understand the Problem ***
-Input: string
-Output: new string
-Rules:
  -output string will stagger capitalization within argument string, with first letter of the string being
  capitalized
  -non-alphabetic characters from argument string should be included in the output string, but do not
  count as characters when counting 'every other character'
-Question:
    -can we assume the argument string will always begin with a letter, or do we need to take into account
      situations where first character might be non-alphabetic, and in this case, would the counting 
      begin at first letter we encounter?

*** Data Structures ***
-Input: string
-Output: string

*** Algorithm ***
-initialize need_upcase variable as true
-split the argument string into an array of characters, and map through each character
    -if character is alphabetic and need_upcase is true
      -upcase the character
      -need_upcase = !need_upcase
    -if character is alphabetic and need_upcase is false
      -downcase the character
      -need_upcase = !need_upcase
    -otherwise, just return the character
-join the characters back into a string
=end

def staggered_case(str)
  need_upcase = true
  staggered_string = str.chars.map do |char|
                       if char =~ /[a-zA-Z]/ && need_upcase
                         need_upcase = !need_upcase
                         char.upcase
                       elsif char =~ /[a-zA-Z]/ && !need_upcase
                         need_upcase = !need_upcase
                         char.downcase
                       else
                         char
                       end
                     end
  staggered_string.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Further Exploration
def staggered_case2(string, count_non_alpha_chars=true)
  result = ''
  need_upcase = true
  string.each_char do |char|
    if need_upcase
      result << char.upcase
    else
      result << char.downcase
    end

    case count_non_alpha_chars
    when true
      need_upcase = !need_upcase
    when false
      need_upcase = !need_upcase if char =~ /[a-z]/i
    end
  end
  result
end

p staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('!!!ALL_CAPS') == '!!!aLl_cApS'
p staggered_case2('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case2('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case2('ALL CAPS', false) == 'AlL cApS'
p staggered_case2('!ignore 77 the 444 numbers', false) == '!IgNoRe 77 ThE 444 nUmBeRs'
