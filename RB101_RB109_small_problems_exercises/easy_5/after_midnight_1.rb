=begin
The time of day can be represented as the number of minutes before or after midnight. 
If the number of minutes is positive, the time is after midnight. If the number of minutes 
is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day 
in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Disregard Daylight Savings and Standard Time and other complications.

*** Understand the Problem ***
-Input: integer - representing the number of minutes in relation to midnight
  -positive means the time is after midnight
  -negative means before midnight
-Output: string
  -time of day in 24 hour format (hh:mm)
-Rules:
  -cannot use Ruby's Date and Time classes
  -In 24 hour format, midnight is represented as '00:00'
  -if given a negative number, would take the number.abs.divmod(60) to convert all those minutes into hours and minutes
    -would subtract the second element of hours.divmod(24) from 23 to get resulting 'hh' portion of the return string
    -subtract the minutes from 60 to get resulting 'mm' portion of the return string
  -if given positive number, again take the number.divmod(60) to get hours and minutes
    -would add the second element of hours.divmod(24) to 0 to get 'hh' portion of return string
    -add minutes to 0 to get 'mm' portion of return string

*** Data Structure ***
-input: integer
-output: string

*** Algorithm ***
-initialize empty hours and minutes storage variables
-check if integer is == 0
  -return '00:00'
-otherwise, if integer is < 0
  -take the absolute number of the given integer and convert to hours and minutes using divmod
  -final hours is hours.divmod(24) subtracted from 23
  -final minutes is minutes subtracted from 60
-otherwise, 
  -convert the given integer into hours and minutes using divmod
  -final hours is hours.divmod(24) added to 0
  -final minutes is minutes added to 0
-if final_hours and final_minutes are single digits (i.e. < 10), then make sure you add an extra 0 before them in the resulting string
-return "#{final_hours}:#{final_minutes}"
=end

def time_of_day(minutes)
  final_hours = nil
  final_minutes = nil
  if minutes == 0
    return '00:00'
  elsif minutes < 0
    hour_minute_array = minutes.abs.divmod(60)
    final_hours = 23 - ((hour_minute_array[0]).divmod(24))[1]
    final_minutes = 60 - hour_minute_array[1]
  else
    hour_minute_array = minutes.divmod(60)
    final_hours = 0 + ((hour_minute_array[0]).divmod(24))[1]
    final_minutes = 0 + hour_minute_array[1]
  end
  final_hours = final_hours.to_s.prepend('0') if final_hours < 10
  final_minutes = final_minutes.to_s.prepend('0') if final_minutes < 10
  "#{final_hours}:#{final_minutes}"
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Further Exploration
require 'date'

STARTING_TIME_AND_DAY = Time.new(2020, 10, 4) # Sunday at midnight

def time_and_day(delta_minutes)
  minutes_to_seconds = delta_minutes * 60
  time_and_day = STARTING_TIME_AND_DAY + minutes_to_seconds
  time_and_day.strftime("%A %H:%M")
end 

p time_and_day(0) == "Sunday 00:00"
p time_and_day(-3) == "Saturday 23:57"
p time_and_day(35) == "Sunday 00:35"
p time_and_day(-1437) == "Saturday 00:03"
p time_and_day(3000) == "Tuesday 02:00"
p time_and_day(800) == "Sunday 13:20"
p time_and_day(-4231) == "Thursday 01:29"
