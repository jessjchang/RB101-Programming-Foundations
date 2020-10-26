=begin
Sort an array of passed in values using merge sort. You can assume that this array may contain only one 
type of data. And that data may be either all numbers or all strings.

Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested 
sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. 
For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]

We then work our way back to a flat array by merging each pair of nested sub-arrays:

[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]

*** Understand the Problem ***
-Input: array
-Output: array
-Rules:
  -can use merge method from previous exercise
  -arrays will always only contain one type of object e.g. either all numbers or all strings - when
  sorting strings, case-insensitive (i.e. 'a' is the same as 'A')
  -break down the given array into sub-arrays until each element is within it's own sub-array, then 
  merge each pair of nested sub-arrays and sort as you go until you have a flat array of completely sorted
  elements

*** Data Structures ***
-Input: array
-Output: array
-integer
-string

*** Algorithm ***
-if the array's size is <= 1, just return the array itself
-1st sub-array will be from index 0 to the array's size / 2, non-inclusive
-2nd sub-array will be from array's size / 2 to the end of the array
-recursively call itself, so that 1st sub-array is reassigned to calling merge_sort on 1st sub-array, so that
we are continuously breaking down the given array smaller and smaller until each element is its own sub-array
and will just return itself. We'll continue to merge these small pieces, sorting them and building them 
back up each time as well
-same with 2nd sub-array
-merge sub-arrays 1 and 2 together
=end

def merge(arr1, arr2)
  merged_arr = []
  index = 0
  arr1.each do |arr1_value|
    loop do
      break if index >= arr2.size || arr2[index] > arr1_value
      merged_arr << arr2[index]
      index += 1
    end
    merged_arr << arr1_value
  end
  merged_arr + arr2[index..-1]
end

def merge_sort(arr)
  return arr if arr.size <= 1
  left_sub_arr = merge_sort(arr[0...(arr.size / 2)])
  right_sub_arr = merge_sort(arr[(arr.size / 2)..-1])
  merge(left_sub_arr, right_sub_arr)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# Further Exploration
def merge_sort2(arr)
  split_arr = arr.map { |el| [el] }
  split_arr << [] if arr.size.odd?
  loop do
    index = 0
    merged_arr = []
    (split_arr.size / 2).times do
      merged_sub_arr = merge(split_arr[index], split_arr[index + 1])
      index += 2
      merged_arr << merged_sub_arr
    end
    split_arr = merged_arr
    break if split_arr.size == 1
    split_arr << [] if split_arr.size.odd?
  end
  split_arr.flatten
end

p merge_sort2([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort2([5, 3]) == [3, 5]
p merge_sort2([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort2(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort2([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
