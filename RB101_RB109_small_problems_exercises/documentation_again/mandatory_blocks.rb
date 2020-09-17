a = [1, 4, 8, 11, 15, 19]

value_over_eight = a.bsearch {|num| num > 8}
puts value_over_eight
# => 11