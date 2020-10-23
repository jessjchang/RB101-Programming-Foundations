=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light
that is initially off. You walk down the row of switches and toggle every one of them. You go back to the
beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back
again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until
you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that
identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

*** Understand the Problem ***
-Input: integer
  -represents number of switches and number of repetitions
-Output: array of integers
  -represents lights still on at the end
-Rules:
  -will go through the repetitions n number of times, with n being the input integer
  -first repetition will be going through and toggling multiples of 1, then multiples of 2, etc.
  -lights either toggle on or off e.g. if it was on in the last repetition and you toggle it again, it will
  be off and vice versa
-Questions:
  -assuming n will always be greater than or equal to 1?

*** Data Structures ***
-Input: integer
-Output: array

*** Algorithm ***
-initialize an empty array to store the lights that are currently on
-will iterate through n times, with n being your input integer
  -initialize a multiplier variable = 1
  -for each time, you'll loop
    -current_iteration * multiplier - break if it is greater than n, otherwise add to your array
    -if the current_iteration * multiplier is already in the array, then you'll delete it from the array
    -increment the multiplier by 1
-return the array
=end

def toggle_switches(n)
  lights_on = []
  1.upto(n) do |count|
    multiplier = 1
    loop do
      break if count * multiplier > n
      if lights_on.include?(count * multiplier)
        lights_on.delete(count * multiplier)
      else
        lights_on << (count * multiplier)
      end
      multiplier += 1
    end
  end
  lights_on
end

p toggle_switches(1) == [1]
p toggle_switches(2) == [1]
p toggle_switches(5) == [1, 4]
p toggle_switches(10) == [1, 4, 9]
p toggle_switches(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# Further Exploration
def initialize_lights(num_of_lights)
  lights = []
  1.upto(num_of_lights) { |num| lights << [num, 'off'] }
  lights
end

def on_lights(lights)
  lights.select { |light_pair| light_pair[1] == 'on' }.map { |light_pair| light_pair[0] }
end

def off_lights(lights)
  lights.select { |light_pair| light_pair[1] == 'off' }.map { |light_pair| light_pair[0] }
end

def joinand(arr, delimiter = ', ', joining_word = 'and')
  if arr.size == 1
    "#{arr[0]} is"
  elsif arr.size == 2
    "#{arr.first} #{joining_word} #{arr.last} are"
  else
    arr[-1] = "#{joining_word} #{arr[-1]}"
    joined_string = arr.join(delimiter)
    "#{joined_string} are"
  end
end

def final_output(lights)
  on_lights = on_lights(lights)
  off_lights = off_lights(lights)
  off_lights_front = (off_lights.size == 1) ? 'light' : 'lights'

  if lights.size == 1
    "light 1 is on."
  else
    "#{off_lights_front} #{joinand(off_lights)} now off; #{joinand(on_lights)} on."
  end
end

def toggle_every_nth_light(lights, nth)
  lights.each do |light_pair|
    if light_pair[0] % nth == 0
      light_pair[1] = (light_pair[1] == 'off') ? 'on' : 'off'
    end
  end
end

def toggle_lights(num_of_lights)
  lights = initialize_lights(num_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end
  final_output(lights)
end

p toggle_lights(1) == 'light 1 is on.'
p toggle_lights(2) == 'light 2 is now off; 1 is on.'
p toggle_lights(5) == 'lights 2, 3, and 5 are now off; 1 and 4 are on.'
p toggle_lights(10) == 'lights 2, 3, 5, 6, 7, 8, and 10 are now off; 1, 4, and 9 are on.'
