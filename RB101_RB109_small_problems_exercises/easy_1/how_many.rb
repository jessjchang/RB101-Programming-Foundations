=begin
Write a method that counts the number of occurrences of each element in a given array.
The words in the array are case-sensitive: 'suv' != 'SUV'. ` 
Once counted, print each element alongside the number of occurrences.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

Expected output:
car => 4
truck => 3
SUV => 1
motorcycle => 2

*** Understand the problem ***
-write method named count_occurrences
-input:
  -pass in one argument (an array) to the method
    -each element of the array is a string
    -each string is case-sensitive
    -what if non-string is included in array, what should the output be?
-output:
  -string with the pattern: "#{element} => #{number of occurrences}", each on own line
  -looks like order in which each element is printed is in order of when it first appears in the array
-rules:
  -count the number of times the element appears in the array
  -strings in array are case-sensitive, so don't need to convert cases

*** Examples/test cases ***
vehicles_case_test = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles_case_test)

Expected output:
car => 4
truck => 3
SUV => 1
motorcycle => 2
suv => 1


*** Data structures ***
-input will be an array of strings
-set up hash to keep track of element/num_of_occurrences key/value pairs
-output will be strings

*** Algorithm ***
1. define method with one parameter, an array
2. initialize empty hash
3. iterate through the array
  -for each element, if hash does not already include "element" as a key, then hash[element] = 1
  -else, hash[element] increments by 1
4. iterate through the hash, and print each key/value pair using string interpolation
=end

# *** CODE ***
def count_occurrences(array)
  counter = Hash.new
  array.each do |element|
    if counter.has_key?(element) == false
      counter[element] = 1
    else
      counter[element] += 1
    end
  end
  counter.each { |element, count| puts "#{element} => #{count}" }
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
count_occurrences(vehicles)

vehicles_case_test = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]
count_occurrences(vehicles_case_test)

# Further Exploration - what if words are case insensitive (e.g. "suv" == "SUV")? 
def count_occurrences_case_insensitive(array)
  counter = Hash.new
  array.each do |element|
    element.downcase!
    if counter.has_key?(element) == false
      counter[element] = 1
    else
      counter[element] += 1
    end
  end
  counter.each { |element, count| puts "#{element} => #{count}" }
end


count_occurrences_case_insensitive(vehicles_case_test) 

