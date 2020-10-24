=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. 
You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern 
Gregorian Calendar) and that it will remain in use for the foreseeable future.

*** Understand the Problem ***
-Input: integer
-Output: integer
  -the number of Friday the 13ths in the year given by the argument
-Rules: 
  -argument year will always be greater than 1752

*** Data Structures ***
-Input: integer
-Output: integer

*** Algorithm ***
-initialize a count variable
-go through each month 1 through 12 of a year, and check if the 13th day of that year is a friday
  -if it is, increment your count variable
-return the count
=end

require 'date'

def friday_13th(year)
  count = 0
  1.upto(12) { |month| count += 1 if Date.new(year, month, 13).friday? }
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Further Exploration
def five_friday_months(year)
  friday_counts = Hash.new(0)
  1.upto(12) do |month|
    start_date = Date.new(year, month, 1)
    end_date = Date.new(year, month, -1)
    friday_counts[month] = (start_date..end_date).to_a.count { |date| date.friday? }
  end
  friday_counts.values.count { |friday_count| friday_count == 5 }
end

p five_friday_months(2020) == 4

