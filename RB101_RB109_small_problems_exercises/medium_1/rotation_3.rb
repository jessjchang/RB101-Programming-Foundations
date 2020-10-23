=begin
If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175.
Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed
in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate
the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument.
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.


*** Understand the Problem ***
-Input: integer
-Output: integer
-Rules:
  -output integer will be maximum rotation of input integer
  -maximum rotation definition - n-digit number
    1. rotate the full number
    2. keep first digit fixed in place, and rotate remaining (n - 1) digits
    3. keep 2nd digit fixed, rotate remaining (n - 2) digits
    4. continue doing as per above until you rotate the final 2 digits
    -will essentially perform a rotation (n - 1) times
  -can use previous rotate_rightmost_digits method
  -will not have to handle multiple 0s i.e. leading zeroes will be dropped
  -if input integer is one digit, output will just be the original number

*** Data Structures ***
-Input: integer
-Output: integer

*** Algorithm ***
-find how many digits input integer has (convert to array of digits and find size) and store in variable digits
-set variable n to number of digits
-do (digits - 1) times
  -call rotate_rightmost_digits on the number and n
  -decrease n by 1
-return the final number
=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, n)
  num_string = num.to_s
  num_string << (rotate_array(num_string.slice!(-n, n).chars)).join
  num_string.to_i
end

def max_rotation(num)
  digits = num.to_s.length
  n = digits
  (digits - 1).times do
    num = rotate_rightmost_digits(num, n)
    n -= 1
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# Further Exploration
def max_rotation2(num)
  num_arr = num.digits.reverse
  digits = num_arr.size
  digits.downto(2) do |n|
    num_arr << num_arr.delete_at(-n)
  end
  num_arr.join.to_i
end

p max_rotation2(8_007_000_123) == 701300820 # leading zero still gets dropped at the final output as it's an integer, but all other leading zeros as we went through the interim processes remained
p max_rotation2(735291) == 321579
p max_rotation2(3) == 3
p max_rotation2(35) == 53
p max_rotation2(105) == 15
p max_rotation2(8_703_529_146) == 7_321_609_845
