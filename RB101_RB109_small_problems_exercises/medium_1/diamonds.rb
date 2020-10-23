=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is 
supplied as an argument to the method. You may assume that the argument will always be an odd integer.

*** Understand the Problem ***
-Input:
  -integer
-Output:
  -4-pointed diamond output made up of '*' symbols
  -diamond will be within an n x n grid, where n is the input argument
    -e.g. if input is 1, only 1 asterisk will be printed in 1x1 grid
    -if input is 3, then diamond will be printed in 3x3 grid
-Rules:
  -argument will always be an odd integer
  -middle row will always be the full row with all asterisks (n number of asterisks), no spaces
  -e.g. if input is 9:
    -1st row: 4 spaces + 1 asterisk
    -2nd row: 3 spaces + 3 asterisks
    -3rd row: 2 spaces + 5 asterisks
    -4th row: 1 space + 7 asterisks
    -5th row (middle row): 9 asterisks
    -6th row: same as 4th row
    -7th row: same as 3rd row
    -8th row: same as 2nd row
    -9th row: same as 1st row

*** Data Structures ***
-Input: integer
-Output: string

*** Algorithm ***
-set num_of_spaces needed for first row to be the input integer / 2
-count up from 1 to the input integer and iterate
  -if the current count is odd:
    -output the num_of_spaces * ' ' and count * '*'
    -decrement num_of_spaces by 1
-now set num_of_spaces to 1
-count from (input integer - 2) down to 1
  -if current count is odd:
    -output the num_of_spaces * ' ' and count * '*'
    -increment num_of_spaces by 1
=end

def diamond(num)
  num_spaces = num / 2
  1.upto(num) do |count|
    if count.odd?
      puts (' ' * num_spaces) + ('*' * count)
      num_spaces -= 1
    end
  end
  num_spaces = 1
  (num - 2).downto(1) do |count|
    if count.odd?
      puts (' ' * num_spaces) + ('*' * count)
      num_spaces += 1
    end
  end
end

diamond(1)
# *
diamond(3)
#  * 
# ***
#  *
diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# Further Exploration
def print_row(grid_size, distance_from_center)
  num_inner_spaces = if distance_from_center == (grid_size - 1) / 2
                       0
                     else
                       (grid_size - 2) - (2 * distance_from_center)
                     end
  inner_spaces = ' ' * num_inner_spaces
  front_spaces = ' ' * distance_from_center
  if distance_from_center == (grid_size - 1) / 2
    puts "#{front_spaces}*"
  else
    puts "#{front_spaces}*#{inner_spaces}*"
  end
end

def diamond_outline(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

diamond_outline(5)

#   *
#  * *
# *   *
#  * *
#   *

diamond_outline(9)
#     *     0
#    * *    1 9 - 8
#   *   *   3 9 - 6
#  *     *  5 9 - 4
# *       * 7 9 - 2
#  *     *
#   *   *
#    * *
#     *