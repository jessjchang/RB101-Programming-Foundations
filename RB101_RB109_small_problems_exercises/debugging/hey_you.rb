=begin
String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU? 
Modify the code so that it produces the expected output.
=end

def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'