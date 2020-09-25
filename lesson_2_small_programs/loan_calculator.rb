# ---------- YAML Module ---------- #
require 'yaml'
MESSAGES = YAML.load_file('loan_calc_messages.yml')

# ---------- Methods ---------- #
def clear_screen
  system('clear')
end

def messages(message_key)
  MESSAGES[message_key]
end

def prompt(message_key,
           custom_data1='',
           custom_data2='',
           custom_data3='',
           custom_data4='')
  if custom_data1
    message = format(messages(message_key),
                     custom_data1: custom_data1,
                     custom_data2: custom_data2,
                     custom_data3: custom_data3,
                     custom_data4: custom_data4)
  else
    message = messages(message_key)
  end
  puts("=> #{message}")
end

def check_name(name)
  /\A[[:alpha:]]*[[:blank:]]?([[:alpha:]]+)\z/.match(name)
end

def get_name
  name = ''
  loop do
    name = gets.chomp
    break if check_name(name)
    prompt('valid_name')
  end
  name
end

def display_greeting
  prompt('welcome')
  name = get_name
  prompt('greeting', name)
end

def valid_amount?(num)
  /\d/.match(num) && /\A\d*(\.\d{0,2})?\z/.match(num) && num.to_f > 0.0
end

def valid_rate?(num)
  /\d/.match(num) && /\A\d*\.?\d*\z/.match(num) && num.to_f >= 0.0
end

def valid_year_duration?(num)
  /\A\d+\z/.match(num) && num.to_i >= 0
end

def valid_month_duration?(num)
  /\A\d+\z/.match(num) && num.to_i >= 0 && num.to_i <= 11
end

def get_loan_amount
  loan_amount = ''
  prompt('get_loan_amount')

  loop do
    loan_amount = gets.chomp

    if loan_amount.to_f == 0.0
      prompt('zero_loan_input')
    elsif valid_amount?(loan_amount)
      break
    else
      prompt('valid_amount')
    end
  end
  loan_amount.to_f
end

def get_annual_interest_rate
  annual_interest_rate = ''
  prompt('get_annual_interest_rate')

  loop do
    annual_interest_rate = gets.chomp

    break if valid_rate?(annual_interest_rate)
    prompt('valid_rate')
  end
  annual_interest_rate.to_f
end

def get_loan_years
  loan_years = ''
  prompt('get_loan_years')

  loop do
    loan_years = gets.chomp

    break if valid_year_duration?(loan_years)
    prompt('valid_year_duration')
  end
  loan_years.to_i
end

def get_loan_addl_months(loan_years)
  loan_addl_months = ''
  prompt('get_loan_addl_months')

  loop do
    loan_addl_months = gets.chomp

    if !valid_month_duration?(loan_addl_months)
      prompt('valid_month_duration')
    elsif loan_years == 0 && loan_addl_months.to_i == 0
      prompt('valid_addl_months')
    else
      break
    end
  end
  loan_addl_months.to_i
end

def format_amount(num)
  format('%.2f', num)
end

def format_rate(num)
  format('%.3f', num)
end

def calc_total_loan_months(loan_years, loan_addl_months)
  (loan_years * 12) + loan_addl_months
end

def calc_monthly_interest_rate(annual_interest_rate)
  (annual_interest_rate / 100) / 12
end

def calc_monthly_payment(loan_amount, monthly_interest_rate, total_loan_months)
  if monthly_interest_rate.to_f == 0.0
    loan_amount / total_loan_months
  else
    loan_amount *
      (monthly_interest_rate /
      (1 - (1 + monthly_interest_rate)**(-total_loan_months)))
  end
end

def calc_total_interest(monthly_payment, total_loan_months, loan_amount)
  (monthly_payment * total_loan_months) - loan_amount
end

def calc_total_payment(loan_amount, total_interest)
  loan_amount + total_interest
end

def final_calculation(loan_amount, annual_interest_rate,
                      loan_years, loan_addl_months)
  prompt('calculating_result', format_amount(loan_amount))

  total_loan_months = calc_total_loan_months(loan_years, loan_addl_months)
  monthly_interest_rate = calc_monthly_interest_rate(annual_interest_rate)
  monthly_payment = calc_monthly_payment(loan_amount, monthly_interest_rate,
                                         total_loan_months)
  total_interest = calc_total_interest(monthly_payment, total_loan_months,
                                       loan_amount)
  total_payment = calc_total_payment(loan_amount, total_interest)

  prompt('final_result', format_amount(monthly_payment))

  prompt('loan_details', format_amount(loan_amount), total_loan_months,
         format_rate(annual_interest_rate), format_rate(monthly_interest_rate))

  prompt('total_details', format_amount(total_interest),
         format_amount(total_payment), format_amount(monthly_payment))
end

def recalc?
  prompt('recalculate')

  recalc_input = ''
  loop do
    recalc_input = gets.chomp
    break if ['y', 'yes', 'n', 'no'].include?(recalc_input.downcase)
    prompt('valid_recalculate_input')
  end

  ['y', 'yes'].include?(recalc_input.downcase)
end

def display_goodbye
  prompt('goodbye')
end

# ---------- Program Start ---------- #
clear_screen()

display_greeting()

# ---------- Main Loop ---------- #
loop do
  loan_amount = get_loan_amount()

  annual_interest_rate = get_annual_interest_rate()

  loan_years = get_loan_years()

  loan_addl_months = get_loan_addl_months(loan_years)

  final_calculation(loan_amount,
                    annual_interest_rate,
                    loan_years,
                    loan_addl_months)

  break unless recalc?()

  clear_screen()
end

display_goodbye()
