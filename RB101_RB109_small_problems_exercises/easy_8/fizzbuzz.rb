=begin
Write a method that takes two arguments: the first is the starting number, 
and the second is the ending number. Print out all numbers between the two numbers, 
except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", 
and finally if a number is divisible by 3 and 5, print "FizzBuzz".

*** Understand the Problem ***
-Input: 2 integers
  -1st integer is starting number
  -2nd integer is ending number
-Output: integer or string
  -print to screen
-Rules: 
  -print all numbers between the starting and ending input numbers
    -if number % 3 == 0, print 'Fizz' instead of number
    -if number % 5 == 0, print 'Buzz' instead of number
    -if number % 3 == 0 && number % 5 == 0, print 'FizzBuzz' instead of number
  -print each element separated by commas

*** Data Structures ***
-Input: number (integer)
-Output: integer or string
-use array to store the output values before printing to screen

*** Algorithm ***
-initialize empty array to store output elements
-range from starting number up to ending number of times 
  -determine what to print, and add that to empty array - separate helper method
-print out empty array joined by commas

Separate helper method - determine what to print:
-use a case statement to determine return value
-if input is divisible by 3 and 5, return 'FizzBuzz'
-elsif input is divisible by 3, return 'Fizz'
-elsif input is divisible by 5, return 'Buzz'
-else, return the input itself
=end

def printed_value(num)
  case 
  when num % 3 == 0 && num % 5 == 0 then 'FizzBuzz'
  when num % 3 == 0 then 'Fizz'
  when num % 5 == 0 then 'Buzz'
  else num
  end
end

def fizzbuzz(starting_num, ending_num)
  output_values = []
  starting_num.upto(ending_num) { |num| output_values << printed_value(num) }
  puts output_values.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz