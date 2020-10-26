=begin
As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:

1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise 
by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:

3  4  1
9  7  5
6  2  8

A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:
3  4  1
9  7  5

is:

9  3
7  4
5  1

Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

*** Understand the Problem ***
-Input: array
-Output: array
-Rules:
  -rotate 90 degrees, meaning:
    -element at "bottom left" of the matrix (e.g. 1st element of the last sub-array) will become "top left"
    (e.g. 1st element of the 1st sub-array)
    -2nd element of the last sub-array will be 1st element of the 2nd sub-array
    ...

    -1st element of 1st sub-array will become last element of the 1st sub-array
    
    -essentially, each row will become column instead, but the 1st row will be the last column, while the 
    last row is the 1st column
-Questions:
  -Can I assume given matrix will always be well-formed, with each sub-array containing equal numbers of 
  elements?

*** Data Structures ***
-Input: 
-Output: 

*** Algorithm ***
-initialize empty array to store results
-number of columns: size of the 1st sub-array within given array
-number of rows: size of the array
-for range from 0 up to but not including the number of columns, for each column index:
  -for range from (number of rows - 1) down to 0, for each row index:
    -map to arr[row_index][column_index] and store in a new row variable
    -append the new row to your results array
-return the results array
=end

def rotate90(arr)
  new_arr = []
  num_columns = arr.first.size
  num_rows = arr.size
  num_columns.times do |column_index|
    new_arr << []
    (num_rows - 1).downto(0) do |row_index|
      new_arr[column_index] << arr[row_index][column_index]
    end
  end
  new_arr
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# Further Exploration
def rotate(arr, degrees)
  new_arr = []
  num_columns = arr.first.size
  num_rows = arr.size
  rotations = degrees / 90
  rotations.times do |_rotation|
    new_arr = []
    num_columns.times do |column_index|
      new_arr << []
      (num_rows - 1).downto(0) do |row_index|
        new_arr[column_index] << arr[row_index][column_index]
      end
    end
    arr = new_arr
  end
  new_arr
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix1 = rotate(matrix1, 90)
new_matrix2 = rotate(matrix1, 180)
new_matrix3 = rotate(matrix1, 270)
new_matrix4 = rotate(matrix1, 360)

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[6, 9, 3], [2, 7, 4], [8, 5, 1]]
p new_matrix3 == [[8, 2, 6], [5, 7, 9], [1, 4, 3]]
p new_matrix4 == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

