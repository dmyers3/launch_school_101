print "What is the bill? "
bill = gets.chomp.to_f

print "What is the tip percentage? "
tip_pct = gets.chomp.to_f / 100

tip_amount = (tip_pct * bill).round(2)

puts "The tip is $#{tip_amount}"
puts "The total is $#{(tip_amount + bill).round(2)}"