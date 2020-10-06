=begin
Write two methods that each take a time of day in 24 hour format, and return the number of minutes 
before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

*** Understand the Problem ***
-2 methods
-input: string
-output: integer representing minutes before or after midnight
  -between 0 and 1439
-Rules:
  -input string '00:00' and '24:00' are both considered midnight

*** Data Structure ***
-input: string
-output: integer

*** Algorithm ***
-set constant MINUTES_IN_A_DAY = 24 * 60
-set constant MINUTES_PER_HOUR = 60

Method after_midnight:
-split the string on ':'
-convert each element to integers
-multiply hours by MINUTES_PER_HOUR, and add to minutes
-take that value modulo MINUTES_IN_A_DAY to account for '00:00' and '24:00'

Method before_midnight:
-return 0 if string == '24:00' or '00:00'
-otherwise, subtract after_midnight(string) from MINUTES_IN_A_DAY
=end

MINUTES_IN_A_DAY = 24 * 60
MINUTES_PER_HOUR = 60

def after_midnight(time)
  hour_min_array = time.split(':')
  hours = hour_min_array[0].to_i
  minutes = hour_min_array[1].to_i
  total_minutes = (hours * MINUTES_PER_HOUR) + minutes
  total_minutes % MINUTES_IN_A_DAY
end

def before_midnight(time)
  return 0 if time == '00:00' || time == '24:00'
  MINUTES_IN_A_DAY - after_midnight(time)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# Further Exploration
require 'time'

def after_midnight2(time)
  hours = Time.parse(time).hour
  minutes = Time.parse(time).min
  total_minutes = (hours * MINUTES_PER_HOUR) + minutes
  total_minutes % MINUTES_IN_A_DAY
end

def before_midnight2(time)
  return 0 if time == '00:00' || time == '24:00'
  MINUTES_IN_A_DAY - after_midnight(time)
end

p after_midnight2('00:00') == 0
p before_midnight2('00:00') == 0
p after_midnight2('12:34') == 754
p before_midnight2('12:34') == 686
p after_midnight2('24:00') == 0
p before_midnight2('24:00') == 0