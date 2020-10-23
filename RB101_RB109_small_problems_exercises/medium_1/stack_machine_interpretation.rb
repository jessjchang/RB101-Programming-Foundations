=begin
A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as 
an Array that just uses the #push and #pop methods.

A stack-and-register programming language is a language that uses a stack of values. Each operation in the 
language operates on a register, which can be thought of as the current value. The register is not part of 
the stack. Operations that require two values pop the topmost item from the stack (that is, the operation 
removes the most recently pushed value from the stack), perform the operation using the popped value and the 
register value, and then store the result back in the register.

Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register 
value, removes the value from the stack, and then stores the result back in the register. Thus, if we start 
with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT 
operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 
28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, 
  and the register is left with the value 168.

Write a method that implements a miniature stack-and-register-based programming language that has the 
following commands:

- n: Place a value n in the "register". Do not modify the stack.
- PUSH: Push the register value on to the stack. Leave the value in the register.
- ADD: Pops a value from the stack and adds it to the register value, storing the result in the register.
- SUB: Pops a value from the stack and subtracts it from the register value, storing the result in the register.
- MULT: Pops a value from the stack and multiplies it by the register value, storing the result in the register.
- DIV: Pops a value from the stack and divides it into the register value, storing the integer result in the 
register.
- MOD: Pops a value from the stack and divides it into the register value, storing the integer remainder of the 
division in the register.
- POP: Remove the topmost item from the stack and place in register
- PRINT: Print the register value

All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program may 
assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent 
value from the stack, and they won't contain unknown tokens.

You should initialize the register to 0.

*** Understand the Problem ***
-Input: string
-Output: integer
-Rules:
  -initialize register to 0
  -arguments will include the above commands as strings
  -when performing an operation with two values, will pop the most recent value from the stack and perform
  the operation on both the value and the current register value - the result will be the new register value 
  -input string can contain multiple commands

*** Data Structures ***
-Input: string
-Output: integer
-array

*** Algorithm ***
-initialize register value as 0
-initialize an empty array to serve as the stack
-separate the input argument into an array of separate commands
-iterate through the array of commands
  -if token is 'PUSH', then add the register value onto the stack array, and leave the register value as is
  -if 'ADD', then pop the last value from the stack array and add to the register value, and reassign the
  register value to the sum
  -if 'SUB', then pop the last value from the stack array and subtract from the register value, and 
  reassign the register value to the difference
  -if 'MULT', then pop the last value from the stack array and multiply by the register value, and
  reassign the register value to the product
  -if 'DIV', then pop the last value from the stack array and divide it into the register value, and
  reassign the register value to the quotient
  -if 'MOD', then pop the last value from the stack array and perform modular operation with the register
  value, and reassign the register value to the modular
  -if 'POP', then pop the last value from the stack array and reassign the register value to it
  -if 'PRINT', then output the current register value to the screen
  -else (if the input command is an integer as string), then reassign the register value to the command 
  converted to an integer
=end

def minilang(program)
  register_value = 0
  stack = []
  program.split.each do |token|
    case token
    when 'PUSH' then stack << register_value
    when 'ADD' then register_value += stack.pop
    when 'SUB' then register_value -= stack.pop
    when 'MULT' then register_value *= stack.pop
    when 'DIV' then register_value /= stack.pop
    when 'MOD' then register_value %= stack.pop
    when 'POP' then register_value = stack.pop
    when 'PRINT' then puts register_value
    else register_value = token.to_i
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)


# Further Exploration

# (3 + (4 * 5) - 7) / (5 % 3)
minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT') 
# 8

VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
NON_EMPTY_STACK_TOKENS = %w(ADD SUB MULT DIV MOD POP)

def empty_stack?(stack, token)
  if stack.empty? && NON_EMPTY_STACK_TOKENS.include?(token.upcase)
    puts "Error: stack is empty! The command #{token} cannot be performed."
    true
  end
end

def invalid_token?(token)
  if !(VALID_TOKENS.include?(token.upcase) || token.to_i.to_s == token)
    puts "Error: invalid token! The command #{token} cannot be performed."
    true
  end
end

def minilang2(program)
  register_value = 0
  stack = []
  program.split.each do |token|
    return if invalid_token?(token)
    return if empty_stack?(stack, token)
    case token.upcase
    when 'PUSH' then stack << register_value
    when 'ADD' then register_value += stack.pop
    when 'SUB' then register_value -= stack.pop
    when 'MULT' then register_value *= stack.pop
    when 'DIV' then register_value /= stack.pop
    when 'MOD' then register_value %= stack.pop
    when 'POP' then register_value = stack.pop
    when 'PRINT' then puts register_value
    else register_value = token.to_i
    end
  end
  nil
end

minilang2('3 push 4 PUSH 5 PUSH print ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang2('3 PUSH POP ADD')
# Error: stack is empty! The command ADD cannot be performed.

minilang2('3 PUSH POP POP')
# Error: stack is empty! The command POP cannot be performed.

minilang2('3 P POP')
# Error: invalid token! The command P cannot be performed.

minilang2('2.5 PUSH ADD PRINT')
# Error: invalid token! The command 2.5 cannot be performed.


