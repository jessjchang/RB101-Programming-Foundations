=begin
In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby 
Array of Arrays.

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be 
transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row 
and 1 column.

*** Understand the Problem ***
-Input: array
-Output: array
-Rules:
  -given matrix will contain at least 1 row and 1 column i.e. will always have at least 1 sub-array nested
  within the given array, and that sub-array will always contain at least 1 element
  -switch the columns with the rows
-Questions: 
  -can I assume each sub-array in the given array will always have an equal number of elements?

*** Data Structures ***
-Input: array
-Output: array

*** Algorithm ***
-initialize empty array to store the results
-for a range 0 to the size of the given array's sub-arrays, iterate through the column index
  -for a range 0 to the size of the given array, map through each row index and store the return value 
  in a new row variable
    -for each row index, reassign the element to arr[row_index][column_index] so that each column will become
    the row instead
    -append this new row to the results array
-return the results array
=end

def transpose(arr)
  new_arr = []
  (0..(arr[0].size - 1)).each do |column_index|
    new_row = (0..arr.size - 1).map { |row_index| arr[row_index][column_index] }
    new_arr << new_row
  end
  new_arr
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

