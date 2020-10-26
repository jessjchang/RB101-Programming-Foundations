=begin
A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays 
has 3 elements. For example:

1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the 
original matrix. For example, the transposition of the array shown above is:

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the 
original matrix. Note that there is a Array#transpose method that does this -- you may not use it for 
this exercise. You also are not allowed to use the Matrix class from the standard library. 
Your task is to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix 
unchanged.

*** Understand the Problem ***
-Input: array (nested)
-Output: new array (nested)
-Rules:
  -may not use the Array#transpose method or the Matrix class
  -do not mutate the original matrix, output must be a new matrix
  -given a 3x3 matrix in nested array format, the output will follow the pattern:
    -1st sub-array: 1st element of original 1st sub-array, 1st element of original 2nd sub-array, 1st element
    of original 3rd sub-array
    -2nd sub-array: 2nd elements of each of the original sub-arrays
    -3rd sub-array: 3rd elements of each of the original sub-arrays

*** Data Structures ***
-Input: array
-Output: array

*** Algorithm ***
-initialize a new array to store new sub-arrays
-count from 0 up to 2 for your element index
  -initialize another empty array to store each sub-array element
  -again, count from 0 up to 2 for your sub-array index: 
    -append to the empty sub-array: from the given array, arr[curr_sub_array][current_element]
  -push the now-populated sub-array into your outer empty results array
-return the results array
=end

def transpose(arr)
  new_matrix = []
  0.upto(2) do |curr_element_index|
    sub_arr = []
    0.upto(2) do |curr_sub_arr_index|
      sub_arr << arr[curr_sub_arr_index][curr_element_index]
    end
    new_matrix << sub_arr
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Further Exploration
def transpose!(arr)
  0.upto(arr.size - 1) do |row|
    row.upto(arr.size - 1) do |column|
      arr[row][column], arr[column][row] = arr[column][row], arr[row][column]
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]