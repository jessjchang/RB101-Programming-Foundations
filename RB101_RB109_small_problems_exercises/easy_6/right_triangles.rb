=begin
Write a method that takes a positive integer, n, as an argument, and displays a right triangle 
whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) 
should have one end at the lower-left of the triangle, and the other end at the upper-right.

*** Understand the Problem ***
-Input: integer
-Output: a right triangle made up of *'s
-Rules:
  -integer argument will always be positive, and represents the number of sides on each side of the output
  triangle
  -first row: (n - 1) spaces, 1 *
  -second row: (n - 2) spaces, 2 *
  -third row: (n - 3) spaces, 3 *
  ...
  -nth row: 0 spaces, n stars

*** Data Structures ***
-Input: integer
-Output: right triangle diagram of sorts made up of *'s
-string to represent and print ' ' and '*' symbols

*** Algorithm ***
-initialize star_counter = 1
-loop n times
  -print using puts (n - star_counter) # of spaces and star_counter # of *
  -increment star_counter
=end

def triangle(int)
  star_counter = 1
  int.times do
    puts "#{' ' * (int - star_counter)}#{'*' * (star_counter)}"
    star_counter += 1
  end
end

triangle(5)
=begin
    *
   **
  ***
 ****
*****
=end

triangle(9)

=begin
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********
=end

# Further Exploration #1 
#Try modifying your solution so it prints the triangle upside down from its current orientation

def triangle_upside_down(int)
  space_counter = 0
  int.times do
    puts "#{' ' * space_counter}#{'*' * (int - space_counter)}"
    space_counter += 1
  end
end

triangle_upside_down(5)
=begin
*****
 ****
  ***
   **
    *
=end

triangle_upside_down(9)

=begin
*********
 ********
  *******
   ******
    *****
     ****
      ***
       **
        *

=end

# Further Exploration #2 
#Try modifying your solution again so that you can display the triangle with the right angle at any corner 
#of the grid.
def triangle_corner(int, corner)
  case corner
  when 'top_left' then int.downto(1) { |star_counter| puts ('*' * star_counter).ljust(int) }
  when 'top_right' then int.downto(1) { |star_counter| puts ('*' * star_counter).rjust(int) }
  when 'bottom_left' then 1.upto(int) { |star_counter| puts ('*' * star_counter).ljust(int) }
  when 'bottom_right' then 1.upto(int) { |star_counter| puts ('*' * star_counter).rjust(int) }
  end
end

triangle_corner(5, 'top_left')
=begin
*****
****
***
**
*
=end

triangle_corner(5, 'bottom_left')

=begin
*
**
***
****
*****
=end

triangle_corner(5, 'bottom_right')
=begin
    *
   **
  ***
 ****
*****    
=end

triangle_corner(5, 'top_right')
=begin
*****
 ****
  ***
   **
    *
=end
