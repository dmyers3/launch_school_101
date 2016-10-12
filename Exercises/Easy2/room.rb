SQMETERS_TO_SQFEET = 10.7639

puts "What is the length of the room (in meters)?"
length = gets.chomp.to_f
puts "What is the width of the room (in meters)?"
width = gets.chomp.to_f

puts "The area of the room is #{(length * width).round(2)} square meters " +
     "(#{(length * width * SQMETERS_TO_SQFEET).round(2)} square feet)."