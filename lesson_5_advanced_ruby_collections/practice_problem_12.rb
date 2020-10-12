# Given the following data structure, and without using the Array#to_h method, write some code that will 
# return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

final_hash = arr.each_with_object({}) do |sub_arr, hash|
               hash[sub_arr[0]] = sub_arr[1]
             end

p final_hash