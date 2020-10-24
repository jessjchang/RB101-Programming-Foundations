=begin
A triangle is classified as follows:

- equilateral: All 3 sides are of equal length
- isosceles: 2 sides are of equal length, while the 3rd is different
- scalene: All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of 
the longest side, and all sides must have lengths greater than 0: if either of these conditions is not 
satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol 
:equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, 
scalene, or invalid.

*** Understand the Problem ***
-Input: 3 numbers (integers or floats)
-Output: symbol
-Rules:
  -Valid triangle:
    -sum of lengths of 2 shortest sides must be greater than length of longest side
    -all sides have lengths > 0
  -Valid triangle types:
    -equilateral: all 3 input numbers will be equal
    -isosceles: 2 of the input numbers are equal, while the 3rd is different
      -the sum of the 3rd side + one of the other numbers must be greater than the 1st number
    -scalene: all 3 input numbers are different
      -the sum of the two smaller numbers must be greater than the largest number

*** Data Structures ***
-Input: numbers (integers or floats)
-Output: symbol
-array

*** Algorithm ***
-if num1 == num2 == num3 > 0, then it's an equilateral triangle
-if num1 <= 0 or num2 <= 0 or num3 <= 0, then it's invalid
-push into an array the 3 numbers, and sort from smallest to largest
  -if array[0] == array[1] or array[1] == array[2], and array[0] + array[1] > array 2, then isosceles
  -if array[0] + array[1] > array[2], then scalene
  -otherwise, invalid
=end

def triangle(length1, length2, length3)
  return :equilateral if length1 > 0 && length1 == length2 && length2 == length3
  return :invalid if length1 <= 0 || length2 <= 0 || length3 <= 0
  length_arr = []
  length_arr << length1 << length2 << length3
  length_arr.sort!
  return :invalid if length_arr[0] + length_arr[1] <= length_arr[2]
  return :isosceles if length_arr[0] == length_arr[1] || length_arr[1] == length_arr[2]
  :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid