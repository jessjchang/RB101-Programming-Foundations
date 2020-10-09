=begin
Write a method that takes a floating point number that represents an angle between 0 and 360 degrees 
and returns a String that represents that angle in degrees, minutes and seconds. 
You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, 
and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:
DEGREE = "\xC2\xB0"

*** Understand the Problem ***
-Input: float 
  -represents an angle between 0 and 360 degrees
-Output: string
  -represents the given angle in degrees, minutes and seconds
  -will include 3 symbols: 
    -degree to represent degrees
    -single quote to represent minutes
    -double quote to represent seconds
-Rules:
  -1 degree == 60 minutes
  -1 minute == 60 seconds
  -use 2-digit numbers for minutes and seconds (if minute or second is a one-digit integer, use a leading zero
  in front of it)
  -if 0 is given, output should be %(0°00'00") - a.k.a. 0 degrees, 0 minutes, 0 seconds
  -if 360 is given, output can be %(360°00'00") or %(0°00'00") - 360 degrees or 0 degrees, no minutes or seconds
  -Rules for converting decimal degrees into degrees/minutes/seconds:
    -if an integer value is given, then that represents degrees and minutes and seconds == 0
    -the whole units of degrees remains the same
    -multiply the decimal portion of the float by 60, and the whole number of that is the minutes
    -take the remaining decimal portion and multiply by 60, and the whole number of that will be the seconds

*** Data Structures ***
-Input: float
-Output: string

*** Algorithm ***
-set your conversion constants: degrees_to_minutes = 60, minutes_to_seconds = 60
-set an empty string to store your string output
-take the given input and call #divmod with 1 to separate the whole number and decimal portions
-the first element of the resulting array will be the degrees - convert to a string object, add that to your string, 
along with the degree symbol
-take the second element of the resulting array and multiply by degrees_to_minutes
-call divmod(1) on that value, and the first element will be your minutes
-convert to string object, and add the minutes to the output string, along with single quote symbol
  -NOTE: when converting to string object, if the value is < 10, add a leading zero in front when
  adding to the output string
-take the second element and multiply by minutes_to_seconds, and call divmod(1) on that value, and the first
element will be the seconds
-convert to string object, and add to the output string, along with double quotes
  -NOTE: when converting to string object, if the value is < 10, add a leading zero in front when
  adding to the output string
=end

DEGREE = "\xC2\xB0"
DEGREES_TO_MINUTES = 60
MINUTES_TO_SECONDS = 60

def dms(decimal_degrees)
  degree_min_sec = %()
  degrees, decimal_minutes = decimal_degrees.divmod(1)
  degree_min_sec << %(#{degrees}#{DEGREE})

  minutes, decimal_seconds = (decimal_minutes * DEGREES_TO_MINUTES).divmod(1)
  if minutes < 10
    degree_min_sec << %(0#{minutes}')
  else
    degree_min_sec << %(#{minutes}')
  end

  seconds = (decimal_seconds * MINUTES_TO_SECONDS).divmod(1).first
  if seconds < 10
    degree_min_sec << %(0#{seconds}")
  else
    degree_min_sec << %(#{seconds}")
  end

  degree_min_sec

end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00") # %(254°35'59")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further Exploration
DEGREES_TO_SECONDS = DEGREES_TO_MINUTES * MINUTES_TO_SECONDS
MAXIMUM_ANGLE = 360

def dms2(decimal_degrees)
  decimal_degrees = decimal_degrees % MAXIMUM_ANGLE
  total_seconds = (decimal_degrees * DEGREES_TO_SECONDS).round
  degrees, remaining_seconds = total_seconds.divmod(DEGREES_TO_SECONDS)
  minutes, seconds = remaining_seconds.divmod(MINUTES_TO_SECONDS)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end


p dms2(400) == %(40°00'00")
p dms2(-40) == %(320°00'00")
p dms2(-420) == %(300°00'00")

p dms2(30) == %(30°00'00")
p dms2(76.73) == %(76°43'48")
p dms2(254.6) == %(254°36'00") 
p dms2(93.034773) == %(93°02'05")
p dms2(0) == %(0°00'00")
p dms2(360) == %(360°00'00") || dms2(360) == %(0°00'00")