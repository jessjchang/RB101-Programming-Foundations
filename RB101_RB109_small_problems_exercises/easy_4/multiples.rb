=begin
Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, 
and then computes the sum of those multiples. For instance, if the supplied number is 20, 
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

*** Understanding the Problem ***
-Input: integer greater than 1
-Output: integer that represents the sum of all multiples of 3 or 5 between 1 and the given argument
-Rules:
  -the given number itself would be included in the sum if it's a multiple of 3 or 5
  -can't duplicate multiples (if a number is a multiple of both 3 and 5, only add it to the sum once)

*** Data structures ***
-input: integer
-output: integer

*** Algorithm ***
-define method named multisum that takes one parameter
-initialize an empty array
-initialize a counter, set equal to 1
-create a loop
  -array << 3 * counter if 3 * counter <= argument && !array.include?(3 * counter)
  -array << 5 * counter if 5 * counter <= argument && !array.include?(5 * counter)
  -counter += 1
  -break if (3 * counter) && (5 * counter) > argument
-return sum of all elements in the array
=end

def multisum(num)
  multiples = []
  counter = 1
  loop do
    multiples << (3 * counter) if ((3 * counter) <= num) && (!multiples.include?(3 * counter))
    multiples << (5 * counter) if ((5 * counter) <= num) && (!multiples.include?(5 * counter))
    counter += 1
    break if ((3 * counter) > num) && ((5 * counter) > num)
  end
  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# Further Exploration
def multisum2(num)
  (1..num).reduce(0) do |sum, current_num|
    current_num % 3 == 0 || current_num % 5 == 0 ? sum + current_num : sum
  end
end


p multisum2(3) == 3
p multisum2(5) == 8
p multisum2(10) == 33
p multisum2(1000) == 234168
