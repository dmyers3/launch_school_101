number = 0
loop do
  puts ">> Please enter an integer greater than 0:"
  number = gets.chomp.to_i
  break if number > 0
end

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  output = 1.upto(number).reduce(:+)
  operator_word = 'sum'
else
  output = 1.upto(number).reduce(:*)
  operator_word = 'product'
end

puts "The #{operator_word} of the integers between 1 and #{number} is #{output}."
  