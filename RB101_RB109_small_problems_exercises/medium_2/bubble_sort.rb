=begin
Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, 
but it's a great exercise for student developers. In this exercise, you will write a method that 
does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, 
each pair of consecutive elements is compared. If the first of the two elements is greater than the second, 
then the two elements are swapped. This process is repeated until a complete pass is made without performing 
any swaps; at that point, the Array is completely sorted.

We can stop iterating the first time we make a pass through the array without making any swaps; 
at that point, the entire Array is sorted.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm 
as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed 
as an argument. You may assume that the Array contains at least 2 elements.

*** Understand the Problem ***
-Input: array
-Output: the same array
-Rules:
  -mutate the given array in-place
  -given array will contain at least 2 elements (integers or strings)
  -bubble sort:
    1. compare first and second elements of array, if 1st element > 2nd element, then swap, else leave as is
    2. compare second and third elements, if 2nd el > 3rd el, then swap, else leave as is
    ...
    break out of this repetition when you've iterated through the entire array without making any swaps
-Questions:
  -will given array elements always be either all integers or all strings (and will strings always only
  contain alphabetic characters)?
  -when comparing strings, is it case-insensitive i.e. 'A' is treated as "equal" to 'a' in terms of alphabet?

*** Data Structures ***
-Input: array
-Output: array
-integers
-strings

*** Algorithm ***
-loop:
  -initialize swap_count = 0
  -map through the array
    -for each element:
      -if current index == array size - 1, then just leave as is
      -otherwise, check if current element > element 1 index higher (if element is a string, compare downcased versions)
        -if so, then swap the elements and increment swap_count by 1, otherwise leave as is
  -break out of loop if swap_count == 0
=end

def bubble_sort!(arr)
  loop do
    swap_count = 0
    arr.map.with_index do |element, index|
      if index == arr.size - 1
        element
      elsif (element.is_a? String) && (element.downcase > arr[index + 1].downcase)
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swap_count += 1
      elsif element > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swap_count += 1
      else
        element
      end
    end
    break if swap_count == 0
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Further Exploration
def bubble_sort2!(arr)
  loop do
    swapped = false
    (arr.size - 1).times do |index|
      next if arr[index] <= arr[index + 1]
      arr[index], arr[index + 1] = arr[index + 1], arr[index]
      swapped = true
    end
    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort2!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort2!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort2!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)