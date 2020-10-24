=begin
A triangle is classified as follows:

- right: One angle of the triangle is a right angle (90 degrees)
- acute: All 3 angles of the triangle are less than 90 degrees
- obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater 
than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, 
:obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. 
You may also assume that the arguments are specified in degrees.

*** Understand the Problem ***
-Input: 3 integers
-Output: symbol
-Rules:
  -arguments are all specified in degrees and will always be integer values
  -valid triangle:
    -sum of angles == 180
    -all angles > 0
  -valid triangle types:
    -right: one angle is 90 degrees
    -acute: all 3 angles are < 90 degrees
    -obtuse: one angle is > 90 degrees

*** Data Structures ***
-Input: integer
-Output: symbol
-array

*** Algorithm ***
-initialize array to store the 3 input degrees
-if sum of all 3 degrees != 180 or any of the degrees are <= 0, then it's invalid
-if the array includes 90, then it's a right triangle
-find the largest number in the array, and if that is greater than 90, it's obtuse
-otherwise, it's acute
=end

def triangle(ang1, ang2, ang3)
  angles = [ang1, ang2, ang3]
  max_ang = angles.max
  case
  when angles.reduce(:+) != 180 || angles.include?(0) || angles.any? { |angle| angle.negative? }
    return :invalid
  when angles.include?(90)
    return :right
  when max_ang > 90
    return :obtuse
  else
    return :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid