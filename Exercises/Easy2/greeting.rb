print "What is your name? "
name = gets.chomp

if name.end_with?('!')
  puts "HELLO #{name.upcase.chomp('!')}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end