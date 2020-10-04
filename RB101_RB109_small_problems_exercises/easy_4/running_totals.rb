=begin
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, 
and each element has the running total from the original Array.

*** Understanding the Problem ***
-Input: array of numbers
-Output: array 
  -same number of elements as argument array
  -each element will be running total of original array 
  -first element of the array will always be the same as the original array,
  and every subsequent element will be sum of the next element and the sum before it
-Rules:
  -if argument is a one element array or empty, then returned array will be the same as the given array

*** Data structures ***
-input: array
-each element within array is an integer
-output: array

*** Algorithm ***
-define method named running_total that takes one parameter
-set sum variable = 0
-iterate through the given array using Array#map
  -for each element, sum += current_element
=end

def running_total(array)
  sum = 0
  array.map { |num| sum += num } 
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Further Exploration - use Enumerable#each_with_object
def running_total2(array)
  sum = 0
  array.each_with_object([]) { |num, sums_array| sums_array << sum += num }
end

p running_total2([2, 5, 13]) == [2, 7, 20]
p running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total2([3]) == [3]
p running_total2([]) == []

# Further Exploration - use Enumerable#inject

def running_total3(array)
  sums_array = []
  array.inject(0) do |sum, num| 
    sums_array << sum + num 
    sum + num
  end
  sums_array
end

p running_total3([2, 5, 13]) == [2, 7, 20]
p running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total3([3]) == [3]
p running_total3([]) == []

# Further Exploration - using both Enumerable#each_with_object and Enumerable#inject in one method call
def running_total4(array)
  sums_array = []
  array.each_with_object([]) do |num, running_array|
    running_array << num
    sums_array << running_array.inject(:+)
  end
  sums_array
end

p running_total4([2, 5, 13]) == [2, 7, 20]
p running_total4([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total4([3]) == [3]
p running_total4([]) == []

