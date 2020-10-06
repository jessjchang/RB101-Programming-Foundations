=begin
Write a method that will take a short line of text, and print it within a box.

*** Understand the Problem ***
-input: string
-output: print contents of string within a box
-Rules:
  -will be additional additional space on either side horizontally and vertically
  -vertically, '|' symbol 
  -horizontally, '-' symbol
  -'+' symbol on all 4 corners of the box

*** Algorithm ***
-count the length of the string
-horizontal: '+' + '-'*(string.length + 2) + '+'
-vertical: '|' + ' '*(string.length + 2) + '|'
-vertical_with_text '|' + ' ' + string + ' ' + '|'
-repeat the vertical
-repeat the horizontal
=end

def print_in_box(string)
  puts horizontal = "+#{'-' * (string.length + 2)}+"
  puts vertical = "|#{' ' * (string.length + 2)}|"
  puts vertical_with_text = "| #{string} |"
  puts vertical
  puts horizontal
end

print_in_box('To boldly go where no one has gone before.') 

print_in_box('') 

# Further Exploration - Modify this method so it will truncate the message if it will be too wide to 
#fit inside a standard terminal window (80 columns, including the sides of the box). 
MAX_NUM_OF_CHARS = 76

def print_in_box2(string)
  string.slice!(MAX_NUM_OF_CHARS..-1) if string.length >= MAX_NUM_OF_CHARS
  puts horizontal = "+#{'-' * (string.length + 2)}+"
  puts vertical = "|#{' ' * (string.length + 2)}|"
  puts vertical_with_text = "| #{string} |"
  puts vertical
  puts horizontal
end

print_in_box2('h' * 75 + 'iii') 

# Further Exploration 2 - try word wrapping very long messages so they appear on multiple lines, 
#but still within a box.

def print_in_box3(string)
  box_width = string[0, MAX_NUM_OF_CHARS].length
  puts horizontal = "+#{'-' * (box_width + 2)}+"
  puts vertical = "|#{' ' * (box_width + 2)}|"

  loop do
    shortened_string = string[0, MAX_NUM_OF_CHARS]
    puts "| #{shortened_string} |"
    string.slice!(0..(shortened_string.length - 1))
    break if string.empty?
  end

  puts vertical
  puts horizontal
end

print_in_box3(('h' * 76) + ('e' * 76) + ('l' * 76) + ('l' * 76) + ('o' * 76)) 

