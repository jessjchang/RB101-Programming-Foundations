=begin
The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. 
Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, 
leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine 
leap years both before and after 1752.

*** Understanding the Problem ***
-Input: integer (year) greater than 0
-Output: boolean
  -true if leap year, else false
-Rules:
  -if year < 1752, if year % 4 == 0, then it is a leap year, otherwise it's not
  -if year > 1752: 
    -if year % 400 == 0, then it's a leap year, or 
    -if year % 4 == 0 and year % 100 != 0, then it's a leap year

*** Data structures ***
-input: integer
-output: boolean

*** Algorithm ***
-define method named leap_year? that takes one parameter
-if year < 1752, check if leap year based off leap year definition above
-else, check if leap year based off leap year definition above
=end

def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true