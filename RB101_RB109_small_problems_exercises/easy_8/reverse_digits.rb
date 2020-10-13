=begin
Write a method that takes a positive integer as an argument and returns that number with its digits reversed. 

*** Understand the Problem ***
-Input: integer (positive)
-Output: integer 
-Rules:
  -output integer will be input integer with digits reversed
  -output integer will not include leading zeros if input integer ended with zeros

*** Data Structures ***
-Input: integer
-Output: integer
-use string to store digits

*** Algorithm ***
-convert input integer into string
-initialize empty output string
-set counter = numeric string's length - 1
-while counter >= 0
  -output string << string[counter]
  -decrement counter
-convert output string back to an integer
=end

def reversed_number(num)
  input_string = num.to_s
  output_string = ''
  counter = (input_string.length - 1)
  while counter >= 0 
    output_string << input_string[counter]
    counter -= 1
  end
  output_string.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1