for num in 1..99
  puts num if num.odd?
end

# Further Exploration
puts (1..99).select { |num| num.odd? }