=begin
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly 
divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, 
then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. 
Write a method that takes any year greater than 0 as input, 
and returns true if the year is a leap year, or false if it is not a leap year.

*** Understanding the Problem ***
-Input: integer greater than 0, representing a year
-Output: boolean
  -true if leap year, else false
-Rules:
  -leap year: year % 4 == 0, unless year % 100 == 0. If year % 100 == 0, then false unless year % 400 == 0
    -if year % 400 == 0, then it's a leap year
    -otherwise, if year % 100 == 0, then it's not a leap year
    -otherwise, if year % 4 == 0, then it is a leap year

*** Data structures ***
-input: integer
-output: boolean

*** Algorithm ***
-define method named leap_year? that takes one parameter
-check if the given argument follows rules of leap year definition above, and return true or false implicitly
=end

def leap_year?(year)
  (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))
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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# Further Exploration
def leap_year2?(year)
  if year % 4 == 0
    return true unless year % 100 == 0
    return true if year % 400 == 0
  end
  false
end


p leap_year2?(2016) == true
p leap_year2?(2015) == false
p leap_year2?(2100) == false
p leap_year2?(2400) == true
p leap_year2?(240000) == true
p leap_year2?(240001) == false
p leap_year2?(2000) == true
p leap_year2?(1900) == false
p leap_year2?(1752) == true
p leap_year2?(1700) == false
p leap_year2?(1) == false
p leap_year2?(100) == false
p leap_year2?(400) == true