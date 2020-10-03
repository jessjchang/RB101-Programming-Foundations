nums = []
num_count = %w(1st 2nd 3rd 4th 5th last)

def valid_num?(num)
  num.to_i.to_s == num
end

def append_num(nums, num)
  nums << num
end

def get_num(count)
  puts "==> Enter the #{count} number: "
  num = ''
  loop do
    num = gets.chomp
    break if valid_num?(num)
    puts "Not a valid number! Try again: "
  end
  num.to_i
end

num = ''
num_count.each do |count|
  num = get_num(count)
  append_num(nums, num) unless count == 'last'
end

if nums.include?(num)
  puts "The number #{num} appears in #{nums}."
else
  puts "The number #{num} does not appear in #{nums}."
end


