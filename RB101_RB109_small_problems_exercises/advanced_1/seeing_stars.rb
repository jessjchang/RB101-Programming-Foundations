=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied 
as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

*** Understand the Problem ***
-Input: integer (will always be odd)
-Output: string
-Rules:
  -smallest star to handle is a 7x7 grid e.g. smallest given integer will be 7
  -output will be displayed as an 8-pointed star (like an asterisk) in an nxn grid, where n is the given argument
  -input 7:
    -1st row: 1 star, 2 spaces, 1 star, 2 spaces, 1 star
    -2nd row: 1 space, 1 star, 1 space, 1 star, 1 space, 1 star
    -3rd row: 2 spaces, 3 stars
    -4th row: 7 stars
    -5th row: same as 3rd row
    -6th row: same as 2nd row
    -7th row: same as 1st row
  -input 9:
    -1st row: 1 star, 3 spaces, 1 star, 3 spaces, 1 star
    -2nd row: 1 space, 1 star, 2 spaces, 1 star, 2 spaces, 1 star
    -3rd row: 2 spaces, 1 star, 1 space, 1 star, 1 space, 1 star
    -4th row: 3 spaces, 3 stars
    -5th row: 9 stars
    -6th row: same as 4th row
    -7th row: same as 3rd row
    -8th row: same as 2nd row
    -9th row: same as 1st row
  -input n:
    -dealing with outer_space, inner_space, stars - pattern for all rows except the middle row: 
        -outer_space, star, inner_space, star, inner_space, star, outer_space
    -1st row: 1 star, ((n - 3) / 2) spaces, 1 star, ((n - 3) / 2) spaces, 1 star
      -outer_space: 0, inner_space: ((n - 3) / 2) - also, inner_space is always distance from midpoint - 1
    -2nd row: 
      -outer_space: increase by 1, inner_space: decrease by 1
    ...
    -(n + 1) / 2 row: n stars
    -bottom rows just mirror the above-midpoint rows

*** Data Structures ***
-Input: integer
-Output: string

*** Algorithm ***
-define a helper method to print a row (other than the midpoint row) that takes distance from midpoint 
and n as arguments:
  -inner_space: (distance from midpoint - 1)
  -num_stars: 3
  -outer_space: (n - (inner_space * 2 + num_stars)) / 2
  -print out: outer_space * ' ', '*', inner_space * ' ', '*',inner_space * ' ', '*'
-find the midpoint row number: (n + 1) / 2
-from (midpoint - 1) down to 1, call the helper method to print row with distance from the midpoint being the
current count you are on
-print the midpoint row: n number of stars
-from 1 up to (midpoint - 1), call helper method
=end

def print_row(n, distance_from_midpoint)
  inner_space = distance_from_midpoint - 1
  num_stars = 3
  outer_space = (n - (inner_space * 2 + num_stars)) / 2
  row = ''
  row << (' ' * outer_space) << '*'
  2.times { row << (' ' * inner_space) << '*' }
  puts row
end

def star(n)
  midpoint = (n + 1) / 2
  (midpoint - 1).downto(1) { |distance| print_row(n, distance) }
  puts '*' * n
  1.upto(midpoint - 1) { |distance| print_row(n, distance) }
end


star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

star(9)

# *   *   *
#  *  *  * 
#   * * * 
#    *** 
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *