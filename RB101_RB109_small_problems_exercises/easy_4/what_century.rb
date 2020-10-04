=begin
Write a method that takes a year as input and returns the century. 
The return value should be a string that begins with the century number, 
and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

*** Understanding the Problem ***
-input: integer
-output: string representing the century of the given integer
-Rules:
  -appropriate endings for each century
    -0: th
    -1: st
    -2: nd
    -3: rd
    -4-9: th
    -11-13: th - exceptions to the normal endings
  -new centuries begin in years that end with 01
    -1-100: 1st 
    -101-200: 2nd 
    -201-300: 3rd
    -301-400: 4th
    -anytime you have a year, divide by 100 and + 1 to get the century, unless year ends in 0, in which case
    century is just year / 100
  

*** Additional examples ***
century(1) == '1st'
century(100) == '1st'
century(101) == '2nd'

*** Data structures ***
-input: integer
-output: string

*** Algorithm ***
-define method named century that takes one parameter
-initialize variable to store string version of year
-if year doesn't end with 0, 
  -then, century number is (year / 100) + 1 
else
  century number is year / 100
-if century number ends with 11, 12, or 13, then concatenate 'th' to the end
-if year ends in 0 or 4-9, concatenate 'th'
-if year ends in 1, concatenate 'st'
-if year ends in 2, concatenate 'nd'
-if year ends in 3, concatenate 'rd'
-return century at the end
=end

def century_ending(century_num)
  if century_num.end_with?('0', '4', '5', '6', '7', '8', '9', '11', '12', '13')
    'th'
  elsif century_num.end_with?('1')
    'st'
  elsif century_num.end_with?('2')
    'nd'
  else
    'rd'
  end
end

def century(year)
  string_year = year.to_s
  if string_year.end_with?('0')
    century_num = (year / 100).to_s
  else
    century_num = ((year / 100) + 1).to_s
  end
  century_num + century_ending(century_num)
end


p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
p century(1) == '1st'
p century(100) == '1st'
p century(101) == '2nd'