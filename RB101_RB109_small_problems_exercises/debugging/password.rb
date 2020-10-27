=begin
The following code prompts the user to set their own password if they haven't done so already, 
and then prompts them to login with that password. However, the program throws an error. What is the 
problem and how can you fix it?
We hadn't passed the variable password into the verify_password method, so Ruby couldn't access it.
We also hadn't assigned the return value of set_password (the value referenced by new_password) to our 
password variable, so it never got updated from nil to whatever we assigned to new_password.

Once you get the program to run without error, does it behave as expected? Verify that you are able to 
log in with your new password.
=end

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)