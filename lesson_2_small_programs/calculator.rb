# ---------- YAML module ----------
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# ---------- Constants ----------
LANGUAGE = {
  '1' => 'en',
  '2' => 'fr',
  '3' => 'es'
}

# ---------- Methods ----------
def clear_screen
  Kernel.system('clear')
end

def messages(message_key, lang='en')
  MESSAGES[lang][message_key]
end

def prompt(message_key, lang,
           custom_data1='', custom_data2='', custom_data3='')
  if custom_data1
    message = format(messages(message_key, lang),
                     custom_data1: custom_data1,
                     custom_data2: custom_data2,
                     custom_data3: custom_data3)
  else
    message = messages(message_key, lang)
  end
  Kernel.puts("=> #{message}")
end

def get_language
  lang_choice = ''
  loop do
    prompt('language_prompt', 'en')
    lang_choice = Kernel.gets().chomp()
    break if LANGUAGE.keys.include?(lang_choice)
    prompt('valid_language', 'en')
  end
  LANGUAGE[lang_choice]
end

def check_name(name)
  /\A[[:alpha:]]*[[:blank:]]?([[:alpha:]]+)\z/.match(name)
end

def get_name(lang)
  name = ''
  loop do
    name = Kernel.gets().chomp()
    break if check_name(name)
    prompt('valid_name', lang)
  end
  name
end

def display_greeting(lang)
  prompt('welcome', lang)

  name = get_name(lang)

  prompt('greeting', lang, name)
end

def valid_integer?(num)
  /\A[+-]?\d+\z/.match(num)
end

def valid_float?(num)
  /\d/.match(num) && /\A[+-]?\d*\.\d*\z/.match(num)
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def get_number(num_place, lang)
  number = ''
  loop do
    prompt(num_place, lang)
    number = Kernel.gets().chomp()
    break if valid_number?(number)
    prompt('valid_number', lang)
  end
  number
end

def get_operator(number2, lang)
  prompt('operator_prompt', lang)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if number2.to_f == 0.0 && operator == '4'
      prompt('zero_division_message', lang)
    elsif ['1', '2', '3', '4'].include?(operator)
      break
    else
      prompt('valid_operator', lang)
    end
  end
  operator
end

def operation_to_message(op, lang)
  message_word = case op
                 when '1'
                   messages('adding', lang)
                 when '2'
                   messages('subtracting', lang)
                 when '3'
                   messages('multiplying', lang)
                 when '4'
                   messages('dividing', lang)
                 end
  message_word
end

def final_calc(number1, number2, operator, lang)
  prompt('operation_message', lang,
         operation_to_message(operator, lang),
         number1, number2)

  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt('result_message', lang, result)
end

def calc_again?(lang)
  prompt('calculate_again', lang)

  answer = ''
  loop do
    answer = Kernel.gets().chomp()
    break if ['y', 'yes', 'n', 'no'].include?(answer.downcase())
    prompt('valid_recalculate_input', lang)
  end

  ['y', 'yes'].include?(answer.downcase())
end

def display_goodbye(lang)
  prompt('goodbye', lang)
end

# ---------- Program Start ----------
clear_screen()

lang = get_language()

display_greeting(lang)

# ---------- Main Loop ----------
loop do
  number1 = get_number('get_number1', lang)
  number2 = get_number('get_number2', lang)

  operator = get_operator(number2, lang)

  final_calc(number1, number2, operator, lang)

  break unless calc_again?(lang)
  clear_screen()
end

display_goodbye(lang)
