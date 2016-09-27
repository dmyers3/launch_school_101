def verify_input(number)
  number.to_f.to_s == number || number.to_i.to_s == number && number.to_f >= 0
end

puts "Welcome to the Mortgate Calculator"

# initialize variables outside blocks
loan = ''
apr = ''
duration = ''

puts "Please enter the Loan Amount"
loop do
  loan = gets.chomp
  if verify_input(loan)
    break
  else
    puts "Please enter a valid loan amount"
  end
end

puts "Please enter the APR (Annual Percentage Rate)"
loop do
  apr = gets.chomp
  if verify_input(apr)
    break
  else
    puts "Please enter a valid APR"
  end
end

puts "Please enter the loan duration in months
(15 years is 180 and 30 years is 360)"
loop do
  duration = gets.chomp
  if verify_input(duration)
    break
  else
    puts "Please enter a valid duration, in months"
  end
end

# convert strings to floats
apr = apr.to_f
loan = loan.to_f
duration = duration.to_f

# calculate monthly interest rate in decimal form
mpr = apr / 12 / 100

# calculate the monthly payment
payment = loan * (mpr / (1 - (1 + mpr)**-duration))

puts "Your monthly payment works out to $#{'%.2f' % payment} per month"
