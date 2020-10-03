OPERATIONS = %i{+ - * / % **}

def get_first_num
  puts "==> Enter the first number: "
  gets.chomp.to_f
end

def get_second_num
  puts "==> Enter the second number: "
  num = ''
  loop do
    num = gets.chomp.to_f
    break if num != 0.0
    puts "Second number can't be 0! Try again: "
  end
  num
end

def perform_operation(operation, num1, num2)
  num1.public_send(operation, num2)
end

def display_result(operation, num1, num2)
  result = perform_operation(operation, num1, num2)
  puts "==> #{num1} #{operation.to_s} #{num2} = #{result}"
end

num1 = get_first_num
num2 = get_second_num

OPERATIONS.each { |operation| display_result(operation, num1, num2) }