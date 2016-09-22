require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('calculator_messages_english.yml')
def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  if num.to_f.to_s == num
    true
  else
    num.to_i.to_s == num
  end
end

def operation_to_message(op)
  case op
  when "a"
    return "addition"
  when "s"
    return "subtraction"
  when "m"
    return "multiplication"
  when "d"
    return "division"
  end
end

prompt(MESSAGES['welcome'])
loop do
  num1 = ''
  num2 = ''
  
  loop do
    prompt(MESSAGES['num1'])
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end
  
  loop do
    prompt(MESSAGES['num2'])
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end
  
  operator_prompt = <<-MSG 
    What operation do you wish to perform? 
    (Enter 'a' for addition, 's' for subtraction, 'm' for multiplication, or 'd' for division)
  MSG
  
  prompt(operator_prompt)
  operation = ""  
  loop do
    operation = gets.chomp
    if %w(a s m d).include?(operation)
      break
    else
      prompt(MESSAGES['valid_operation'])
    end
  end
  
  output = case operation
  when "a" 
    "%g" % (num1.to_f + num2.to_f)
  when "s"
    "%g" % (num1.to_f - num2.to_f)
  when "m"
    "%g" % (num1.to_f * num2.to_f)
  when "d"
    "%g" % (num1.to_f / num2.to_f)
  end
  
  prompt("The result of peforming the #{operation_to_message(operation)} operation on #{num1} and #{num2} is #{output}")
  prompt(MESSAGES['recalculate'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['exit'])
